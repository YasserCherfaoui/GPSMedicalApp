# GPS Médical — Flutter mobile monorepo (patient_app, specialist_app, shared_lib).
#
#   make -C mobile pub-get   # resolve dependencies in all packages
#   make -C mobile analyze   # flutter analyze (zero warnings required)
#   make -C mobile format    # apply dart format
#   make -C mobile ci        # format check + analyze (matches CI)

PACKAGES := shared_lib patient_app specialist_app
OPENAPI_SPEC := $(abspath ../docs/api/openapi.yaml)
API_PKG := shared_lib/packages/gps_medical_api
API_PUBSPEC := shared_lib/tool/gps_medical_api.pubspec.yaml

.PHONY: pub-get analyze format format-check test ci build-apk build-ios gen-models gen-providers configure-firebase-patient setup-maps-secrets

gen-providers:
	cd shared_lib && dart pub get && dart run build_runner build --delete-conflicting-outputs
	cd patient_app && dart pub get && dart run build_runner build --delete-conflicting-outputs

# Downloads google-services.json, GoogleService-Info.plist, and firebase_options.dart
# for project gps-medical-dev. Requires: firebase login --reauth
configure-firebase-patient:
	chmod +x patient_app/scripts/configure_firebase.sh
	patient_app/scripts/configure_firebase.sh

# Writes ios/Flutter/MapsSecrets.xcconfig and android/maps-secrets.properties from patient_app/secrets.env
setup-maps-secrets:
	chmod +x patient_app/scripts/apply_maps_secrets.sh
	patient_app/scripts/apply_maps_secrets.sh

gen-models:
	rm -rf $(API_PKG)
	npx --yes @openapitools/openapi-generator-cli generate \
		-i $(OPENAPI_SPEC) \
		-g dart-dio \
		-o $(API_PKG) \
		--additional-properties=pubName=gps_medical_api,dateLibrary=core,useEnumExtension=true
	cp $(API_PUBSPEC) $(API_PKG)/pubspec.yaml
	cp shared_lib/tool/gps_medical_api.analysis_options.yaml $(API_PKG)/analysis_options.yaml
	cd $(API_PKG) && dart pub get && dart run build_runner build --delete-conflicting-outputs

pub-get:
	@for d in $(PACKAGES); do \
		echo "==> $$d: flutter pub get"; \
		(cd $$d && flutter pub get) || exit 1; \
	done

analyze: pub-get
	@for d in $(PACKAGES); do \
		echo "==> $$d: flutter analyze"; \
		(cd $$d && flutter analyze) || exit 1; \
	done

format:
	dart format shared_lib/lib shared_lib/test patient_app specialist_app

format-check:
	dart format --set-exit-if-changed shared_lib/lib shared_lib/test patient_app specialist_app

test: pub-get
	@for d in $(PACKAGES); do \
		echo "==> $$d: flutter test"; \
		if [ "$$d" = "patient_app" ]; then \
			(cd $$d && flutter test --exclude-tags staging) || exit 1; \
		else \
			(cd $$d && flutter test) || exit 1; \
		fi; \
	done

test-booking-staging:
	cd patient_app && STAGING_INTEGRATION=1 flutter test test/features/booking/staging --tags staging --concurrency=1

ci: format-check analyze test

build-apk: pub-get
	@for d in patient_app specialist_app; do \
		echo "==> $$d: flutter build apk --debug"; \
		(cd $$d && flutter build apk --debug) || exit 1; \
	done

build-ios: pub-get
	@for d in patient_app specialist_app; do \
		echo "==> $$d: flutter build ios --debug --no-codesign"; \
		(cd $$d && flutter build ios --debug --no-codesign) || exit 1; \
	done
