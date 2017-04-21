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

/// A struct representing the profile data Address Global object from the received profile JSON file
public struct HATProfileDataProfileAddressGlobalObject: Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: HATProfileDataProfileAddressGlobalObject, rhs: HATProfileDataProfileAddressGlobalObject) -> Bool {
        
        return (lhs.isPrivate == rhs.isPrivate && lhs.city == rhs.city && lhs.country == rhs.country && lhs.county == rhs.county)
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
    public static func <(lhs: HATProfileDataProfileAddressGlobalObject, rhs: HATProfileDataProfileAddressGlobalObject) -> Bool {
        
        return lhs.city < rhs.city
    }
    
    // MARK: - Variables

    /// Indicates if the object, HATProfileDataProfileAddressGlobalObject, is private
    public var isPrivate: Bool = true
    
    /// User's City
    public var city: String = ""
    /// User's Country
    public var country: String = ""
    /// User's County
    public var county: String = ""
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        isPrivate = true
        city = ""
        county = ""
        country = ""
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
        
        if let tempCounty = (dict["county"]?.stringValue) {
            
            county = tempCounty
        }
        
        if let tempCountry = (dict["country"]?.stringValue) {
            
            country = tempCountry
        }
        
        if let tempCity = (dict["city"]?.stringValue) {
            
            city = tempCity
        }
    }
}
