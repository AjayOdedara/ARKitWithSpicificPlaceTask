//
//  LocationCollection.swift
//  ARWithLocationTask
//
//  Created by admin on 18/02/18.
//  Copyright © 2018 Aj. All rights reserved.
//

import Foundation

public class LocationCollection : NSObject, NSCoding{
    
    public var locationName: String?
    public var lat: String?
    public var long: String?
    
    init(locationName:String,lat:String,long:String) {

        self.locationName   = locationName
        self.lat            = lat
        self.long           = long
    }
    required public init?(coder aDecoder: NSCoder) {
        self.locationName = aDecoder.decodeObject(forKey: "locationName") as? String;
        self.lat = aDecoder.decodeObject(forKey: "lat") as? String;
        self.long = aDecoder.decodeObject(forKey: "long") as? String;
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.locationName, forKey: "locationName");
        aCoder.encode(self.lat, forKey: "lat");
        aCoder.encode(self.long, forKey: "long");
    }
}
