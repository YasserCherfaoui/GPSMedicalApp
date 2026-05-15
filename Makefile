# GPS Médical — Flutter mobile monorepo (patient_app, specialist_app, shared_lib).
#
#   make -C mobile pub-get   # resolve dependencies in all packages
#   make -C mobile analyze   # flutter analyze (zero warnings required)
#   make -C mobile format    # apply dart format
#   make -C mobile ci        # format check + analyze (matches CI)

PACKAGES := shared_lib patient_app specialist_app

.PHONY: pub-get analyze format format-check test ci build-apk build-ios

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
	dart format $(PACKAGES)

format-check:
	dart format --set-exit-if-changed $(PACKAGES)

test: pub-get
	@for d in $(PACKAGES); do \
		echo "==> $$d: flutter test"; \
		(cd $$d && flutter test) || exit 1; \
	done

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
