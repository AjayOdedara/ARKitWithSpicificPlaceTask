//
//  AppDelegate.swift
//  ARWithLocationTask
//
//  Created by admin on 18/02/18.
//  Copyright © 2018 Aj. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let locationManager = CLLocationManager()
    var one_time_execution = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        registerLocationManager()
        GMSServices.provideAPIKey("AIzaSyDSsmE6K_d5WFN6hX-K44l2kFcKqLWW4Qg")
        GMSPlacesClient.provideAPIKey("AIzaSyDSsmE6K_d5WFN6hX-K44l2kFcKqLWW4Qg")
        return true
    }
    
    private func registerLocationManager() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

}

