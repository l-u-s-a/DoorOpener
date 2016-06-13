//
//  TokenManager.swift
//  Door Opener
//
//  Created by Luka Usalj on 16/05/16.
//  Copyright © 2016 FER. All rights reserved.
//

import UIKit

final class TokenManager: NSObject {
    static var token: String {
        get {
            return NSUserDefaults.standardUserDefaults().valueForKey(kUserDefaultsTokenKey) as! String
        } set {
            NSUserDefaults.standardUserDefaults().setValue(newValue, forKey: kUserDefaultsTokenKey)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    static var userHasToken: Bool {
        return NSUserDefaults.standardUserDefaults().valueForKey(kUserDefaultsTokenKey) != nil
    }
}
