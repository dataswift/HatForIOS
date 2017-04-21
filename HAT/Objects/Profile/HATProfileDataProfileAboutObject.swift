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

/// A struct representing the profile data About object from the received profile JSON file
public struct HATProfileDataProfileAboutObject: Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: HATProfileDataProfileAboutObject, rhs: HATProfileDataProfileAboutObject) -> Bool {
        
        return (lhs.isPrivate == rhs.isPrivate && lhs.title == rhs.title && lhs.body == rhs.body)
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
    public static func <(lhs: HATProfileDataProfileAboutObject, rhs: HATProfileDataProfileAboutObject) -> Bool {
        
        return lhs.title < rhs.title
    }
    
    // MARK: - Variables

    /// Indicates if the object, HATProfileDataProfileAboutObject, is private
    public var isPrivate: Bool = true
    
    /// The title of the about section
    public var title: String = ""
    /// The body of the about section
    public var body: String = ""
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        isPrivate = true
        title = ""
        body = ""
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
        
        if let tempTitle = (dict["title"]?.stringValue) {
            
            title = tempTitle
        }
        
        if let tempBody = (dict["body"]?.stringValue) {
            
            body = tempBody
        }
    }
    
}
