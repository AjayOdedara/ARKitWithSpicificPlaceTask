//
//  SCNVector3+Extensions.swift
//  ARWithLocationTask
//
//  Created by admin on 19/02/18.
//  Copyright © 2018 Aj. All rights reserved.
//

import SceneKit

extension SCNVector3 {
    ///Calculates distance between vectors
    ///Doesn't include the y axis, matches functionality of CLLocation 'distance' function.
    func distance(to anotherVector: SCNVector3) -> Float {
        return sqrt(pow(anotherVector.x - x, 2) + pow(anotherVector.z - z, 2))
    }
}
