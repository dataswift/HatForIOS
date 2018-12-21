/**
 * Copyright (C) 2018 HAT Data Exchange Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

// MARK: Struct

public struct HATDataPlugInformation: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `information` in JSON is `plug`
     * `provider` in JSON is `provider`
     */
    private enum CodingKeys: String, CodingKey {
        
        case plugID = "uuid"
        case providerID = "providerId"
        case dateCreated = "created"
        case name = "name"
        case description = "description"
        case url = "url"
        case imageURL = "illustrationUrl"
        case passwordHash = "passwordHash"
        case isApproved = "approved"
        case shouldShowCheckMark = "showCheckMark"
    }
    
    // MARK: - Variables

    /// The uuid of the plug
    public var plugID: String = ""
    /// The provider of the plug
    public var providerID: String = ""
    /// The date the plug was created as unix time stamp
    public var dateCreated: Int = 0
    /// The name of the plug
    public var name: String = ""
    /// The description of the plug
    public var description: String = ""
    /// The url of the plug
    public var url: String = ""
    /// The image url of the plug
    public var imageURL: String = ""
    /// The password has value of the plug
    public var passwordHash: String = ""
    /// Is the plug approved for use
    public var isApproved: Bool = false
    
    /// is the plug connected, if it is show checkmark
    public var shouldShowCheckMark: Bool? = false
}
