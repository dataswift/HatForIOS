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

public struct HATProfileDataProfilePersonalObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfilePersonalObject, is private
    public var `private`: Bool = true
    
    /// User's first name
    public var first_name: String = ""
    
    /// User's last name
    public var last_name: String = ""
    
    /// User's middle name
    public var middle_name: String = ""
    
    /// User's preffered name
    public var preferred_name: String = ""
    
    /// User's title
    public var title: String = ""
}
