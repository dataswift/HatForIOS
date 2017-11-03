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

public struct HATProfileDataProfileEmergencyContactObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileEmergencyContactObject, is private
    public var `private`: Bool = true
    
    /// The first name of the user's emergency contact
    public var first_name: String = ""
    
    /// The last name of the user's emergency contact
    public var last_name: String = ""
    
    /// The user's relationship with the emergency contact
    public var relationship: String = ""
    
    /// The mobile number of the user's emergency contact
    public var mobile: String = ""
}
