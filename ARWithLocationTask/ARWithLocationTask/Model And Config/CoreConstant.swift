//
//  CoreConfig.swift
//  ARWithLocationTask
//
//  Created by admin on 18/02/18.
//  Copyright © 2018 Aj. All rights reserved.
//

import Foundation

public class CoreConfig {
    
    let defaults = UserDefaults.standard
    
    public static let sharedInstance = CoreConfig()
    private init() {}
    var collections:[LocationCollection]{
        return loadData()!
    }
    func loadData()->[LocationCollection]?{

        if let data = UserDefaults.standard.data(forKey: "userLocationData"),
            let myPeopleList = NSKeyedUnarchiver.unarchiveObject(with: data) as? [LocationCollection] {
            return myPeopleList
        } else {
            print("No Data")
            return [LocationCollection]()
        }
    }
}

