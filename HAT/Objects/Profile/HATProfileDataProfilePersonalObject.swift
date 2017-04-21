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

/// A struct representing the profile data Personal object from the received profile JSON file
public struct HATProfileDataProfilePersonalObject: Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: HATProfileDataProfilePersonalObject, rhs: HATProfileDataProfilePersonalObject) -> Bool {
        
        return (lhs.isPrivate == rhs.isPrivate && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.middleName == rhs.middleName && lhs.prefferedName == rhs.prefferedName && lhs.title == rhs.title)
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
    public static func <(lhs: HATProfileDataProfilePersonalObject, rhs: HATProfileDataProfilePersonalObject) -> Bool {
        
        return lhs.lastName < rhs.lastName
    }
    
    // MARK: - Variables

    /// Indicates if the object, HATProfileDataProfilePersonalObject, is private
    public var isPrivate: Bool = true
    
    /// User's first name
    public var firstName: String = ""
    /// User's last name
    public var lastName: String = ""
    /// User's middle name
    public var middleName: String = ""
    /// User's preffered name
    public var prefferedName: String = ""
    /// User's title
    public var title: String = ""
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        isPrivate = true
        firstName = ""
        lastName = ""
        middleName = ""
        prefferedName = ""
        title = ""
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
        
        if let tempFirstName = (dict["first_name"]?.stringValue) {
            
            firstName = tempFirstName
        }
        
        if let tempLastName = (dict["last_name"]?.stringValue) {
            
            lastName = tempLastName
        }
        
        if let tempPrefferedName = (dict["preferred_name"]?.stringValue) {
            
            prefferedName = tempPrefferedName
        }
        
        if let tempMiddleName = (dict["middle_name"]?.stringValue) {
            
            middleName = tempMiddleName
        }
        
        if let tempTitle = (dict["title"]?.stringValue) {
            
            title = tempTitle
        }
    }
    
}
