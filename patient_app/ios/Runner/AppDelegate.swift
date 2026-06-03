import Flutter
import GoogleMaps
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Maps SDK key (ADR 0009): secrets.env → MapsSecrets.xcconfig → GMSApiKey, or GoogleService-Info.plist.
    // Enable "Maps SDK for iOS" on the GCP project and allow this app's bundle identifier.
    if let apiKey = Self.resolveGoogleMapsApiKey() {
      GMSServices.provideAPIKey(apiKey)
    } else {
      #if DEBUG
      NSLog(
        "Google Maps: missing API key — add GMSApiKey to Info.plist or configure GoogleService-Info.plist"
      )
      #endif
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private static func resolveGoogleMapsApiKey() -> String? {
    if let key = Bundle.main.infoDictionary?["GMSApiKey"] as? String, !key.isEmpty {
      return key
    }
    if let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
       let plist = NSDictionary(contentsOfFile: path),
       let key = plist["API_KEY"] as? String,
       !key.isEmpty
    {
      return key
    }
    return nil
  }
}
