//
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

public struct HATSpotifyProfileObject: HATObject {
    
    // MARK: - Coding Keys
    
    /// The names of the values in the JSON received
    enum CodingKeys: String, CodingKey {
        
        case spotifyID = "id"
        case uri = "uri"
        case href = "href"
        case email = "email"
        case images = "images"
        case country = "country"
        case product = "product"
        case birthdate = "birthdate"
        case followers = "followers"
        case dateCreated = "dateCreated"
        case displayName = "display_name"
        case externalUrls = "external_urls"
    }
    
    // MARK: - Variables

    public var spotifyID: String = ""
    public var uri: String = ""
    public var href: String = ""
    public var email: String = ""
    public var images: [HATSpotifyProfileImagesObject] = []
    public var country: String = ""
    public var product: String = ""
    public var birthdate: String = ""
    public var followers: HATSpotifyProfileFollowersObject = HATSpotifyProfileFollowersObject()
    public var dateCreated: String = ""
    public var displayName: String?
    public var externalUrls: HATSpotifyProfileExternalURLObject = HATSpotifyProfileExternalURLObject()
}
