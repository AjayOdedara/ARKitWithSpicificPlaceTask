//
//  SceneLocationEstimate.swift
//  ARWithLocationTask
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Aj. All rights reserved.
//

import Foundation
import CoreLocation
import SceneKit

class SceneLocationEstimate {
    let location: CLLocation
    let position: SCNVector3
    
    init(location: CLLocation, position: SCNVector3) {
        self.location = location
        self.position = position
    }
}
