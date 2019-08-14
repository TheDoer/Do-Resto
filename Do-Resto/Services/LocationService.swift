//
//  LocationServices.swift
//  Do-Resto
//
//  Created by adonis rumbwere on 12/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import Foundation
import CoreLocation


enum Result<T> {
    case success(T) //On success it takes associtaed type T
    case failure(Error)
}

final class LocationService: NSObject {
    private let manager: CLLocationManager
    
    init(manager: CLLocationManager = .init()) {
        self.manager = manager
        super.init()
        manager.delegate = self
        
    }
    
    //Closures
    
    var newLocation: ((Result<CLLocation>) -> Void)?
    
    var didChangeStatus: ((Bool) -> Void)?
    
    var status: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
    //asking for users permission to ask for location
    //That little dialogue that asks for location
    
    func requestLocationAuthorizatiion() {
        manager.requestWhenInUseAuthorization()
    }
    
    //ask manager to request location updates
    func getLocation()  {
        manager.requestLocation()
    }
    
}

//Location Callbacks

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        newLocation?(.failure(error))
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.sorted(by: { $0.timestamp > $1.timestamp}).first {
            //callback with new location from manager on line 46
            newLocation?(.success(location))
            
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            didChangeStatus?(false)
        default:
            didChangeStatus?(true)
        }
        }
        
    }
    
}


