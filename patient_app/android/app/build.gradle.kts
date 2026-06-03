plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Applied only after `make -C mobile configure-firebase-patient` writes google-services.json.
if (file("src/dev/google-services.json").exists()) {
    apply(plugin = "com.google.gms.google-services")
}

import java.util.Properties

/** Maps API key: secrets.env → maps-secrets.properties → google-services.json (ADR 0009). */
fun readGoogleMapsApiKey(): String {
    val mapsSecrets = rootProject.file("maps-secrets.properties")
    if (mapsSecrets.exists()) {
        val props = Properties()
        mapsSecrets.inputStream().use { props.load(it) }
        props.getProperty("GOOGLE_MAPS_API_KEY")?.trim()?.takeIf { it.isNotEmpty() }?.let {
            return it
        }
    }

    val candidates = listOf(
        file("src/dev/google-services.json"),
        file("src/staging/google-services.json"),
        file("src/prod/google-services.json"),
    )
    val pattern = Regex(""""current_key"\s*:\s*"([^"]+)"""")
    for (candidate in candidates) {
        if (!candidate.exists()) continue
        val match = pattern.find(candidate.readText()) ?: continue
        return match.groupValues[1]
    }
    return ""
}

val googleMapsApiKey: String = readGoogleMapsApiKey()

android {
    namespace = "com.gpsmedical.patient_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.gpsmedical.patient_app"
        manifestPlaceholders["googleMapsApiKey"] = googleMapsApiKey
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions += "default"

    productFlavors {
        create("dev") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            manifestPlaceholders["appName"] = "GPS Pat Dev"
        }
        create("staging") {
            dimension = "default"
            applicationIdSuffix = ".staging"
            manifestPlaceholders["appName"] = "GPS Pat Stg"
        }
        create("prod") {
            dimension = "default"
            manifestPlaceholders["appName"] = "GPS Patient"
        }
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
