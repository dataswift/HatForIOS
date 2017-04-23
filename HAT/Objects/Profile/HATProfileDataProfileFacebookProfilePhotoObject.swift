/**
 * Copyright (C) 2017 HAT Data Exchange Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

import SwiftyJSON

// MARK: Struct

/// A struct representing the profile data Facebook Profile Photo object from the received profile JSON file
public struct HATProfileDataProfileFacebookProfilePhotoObject: Equatable {
    
    // MARK: - Equatable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: HATProfileDataProfileFacebookProfilePhotoObject, rhs: HATProfileDataProfileFacebookProfilePhotoObject) -> Bool {
        
        return (lhs.isPrivate == rhs.isPrivate)
    }
    
    // MARK: -  Variables

    /// Indicates if the object, HATProfileDataProfileFacebookProfilePhotoObject, is private
    public var isPrivate: Bool = true
    
    /// A tuple containing the isPrivate and the ID of the value
    var isPrivateTuple: (Bool, Int)? = nil
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        isPrivate = true
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     */
    public init(from array: [JSON]) {
        
        for json in array {
            
            let dict = json.dictionaryValue
            
            if let tempName = (dict["name"]?.stringValue) {
                
                if tempName == "private" {
                    
                    if let tempValues = dict["values"]?.arrayValue {
                        
                        isPrivate = Bool((tempValues[0].dictionaryValue["value"]?.stringValue)!)!
                        isPrivateTuple = (isPrivate, (dict["id"]?.intValue)!)
                    }
                }
            }
        }
    }
    
}
