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

/// A struct representing the profile data Website object from the received profile JSON file
public struct HATProfileDataProfileWebsiteObject: Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: HATProfileDataProfileWebsiteObject, rhs: HATProfileDataProfileWebsiteObject) -> Bool {
        
        return (lhs.isPrivate == rhs.isPrivate && lhs.link == rhs.link)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func <(lhs: HATProfileDataProfileWebsiteObject, rhs: HATProfileDataProfileWebsiteObject) -> Bool {
        
        return lhs.link < rhs.link
    }
    
    // MARK: - Variables

    /// Indicates if the object, HATProfileDataProfileWebsiteObject, is private
    public var isPrivate: Bool = true
    
    /// Link to user's website
    public var link: String = ""
    
    var isPrivateTuple: (Bool, Int)? = nil
    var linkTuple: (Bool, Int)? = nil
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        isPrivate = true
        link = ""
        
        isPrivateTuple = nil
        linkTuple = nil
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     */
    public init(from dict: Dictionary<String, JSON>) {
        
        if let tempPrivate = (dict["private"]?.stringValue) {
            
            if let unwrappedTempPrivate = Bool(tempPrivate) {
                
                isPrivate = unwrappedTempPrivate
            }
        }
        
        if let tempLink = (dict["link"]?.stringValue) {
            
            link = tempLink
        }
    }
    
}
