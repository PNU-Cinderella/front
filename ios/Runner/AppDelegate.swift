import UIKit
import Flutter
// import GoogleMaps  // Add this import

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
  }
    GeneratedPluginRegistrant.register(with: self)
    // TODO: Add your Google Maps API key
    // GMSServices.provideAPIKey("AIzaSyB4W9Bydugx5SVN36cWaf2sFeumVLcH9OY")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
