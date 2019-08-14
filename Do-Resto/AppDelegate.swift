//
//  AppDelegate.swift
//  Do-Resto
//
//  Created by adonis rumbwere on 11/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow()
    //Initialize location services
    let locationService = LocationService()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        switch locationService.status {
        case .notDetermined,.denied,.restricted:
          let locationViewController = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
         locationViewController?.locationService = locationService
            window.rootViewController = locationViewController
        default:
            assertionFailure()
        }
        window.makeKeyAndVisible()

        return true
    }

}

