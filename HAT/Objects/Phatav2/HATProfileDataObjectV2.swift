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

public struct HATProfileDataObjectV2: Codable, HATObject {

    /// The website object of user's profile
    public var about: HATProfileDataProfileAboutObjectV2 = HATProfileDataProfileAboutObjectV2()
    /// The nickname object of user's profile
    public var photo: HATProfileDataProfilePhotoObjectV2 = HATProfileDataProfilePhotoObjectV2()
    /// The primary email address object of user's profile
    public var online: HATProfileDataProfileOnlineObjectV2 = HATProfileDataProfileOnlineObjectV2()
    /// The youtube object of user's profile
    public var address: HATProfileDataProfileAddressObjectV2 = HATProfileDataProfileAddressObjectV2()
    /// The global addres object of user's profile
    public var contact: HATProfileDataProfileContactObjectV2 = HATProfileDataProfileContactObjectV2()
    /// The youtube object of user's profile
    public var personal: HATProfileDataProfilePersonalObjectV2 = HATProfileDataProfilePersonalObjectV2()
    /// The global addres object of user's profile
    public var emergencyContact: HATProfileDataProfileEmergencyContactObjectV2 = HATProfileDataProfileEmergencyContactObjectV2()
    
    public var dateCreated: Int?
    public var dateCreatedLocal: String?
    public var shared: Bool = false
}
