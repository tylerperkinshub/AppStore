//
//  App.swift
//  AppStore
//
//  Created by Tyler Perkins on 8/6/17.
//  Copyright © 2017 Tyler Perkins. All rights reserved.
//

import Foundation
import UIKit

class App: NSObject {
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
    
    var screenshots: [String]?
    var desc: String?
    var appInformation: AnyObject?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "description" {
            self.desc = value as? String
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    
}

