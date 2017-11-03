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
    public var website: HATProfileDataProfileWebsiteObjectV2 = HATProfileDataProfileWebsiteObjectV2()
    /// The nickname object of user's profile
    public var nick: HATProfileDataProfileNickObjectV2 = HATProfileDataProfileNickObjectV2()
    /// The primary email address object of user's profile
    public var primary_email: HATProfileDataProfilePrimaryEmailObjectV2 = HATProfileDataProfilePrimaryEmailObjectV2()
    /// The youtube object of user's profile
    public var youtube: HATProfileDataProfileYoutubeObjectV2 = HATProfileDataProfileYoutubeObjectV2()
    /// The global addres object of user's profile
    public var address_global: HATProfileDataProfileAddressGlobalObjectV2 = HATProfileDataProfileAddressGlobalObjectV2()
    /// The linkedIn object of user's profile
    public var linkedin: HATProfileDataProfileLinkedInObjectV2 = HATProfileDataProfileLinkedInObjectV2()
    /// The birth date object of user's profile
    public var birth: HATProfileDataProfileBirthObjectV2 = HATProfileDataProfileBirthObjectV2()
    /// The home phone number object of user's profile
    public var home_phone: HATProfileDataProfileHomePhoneObjectV2 = HATProfileDataProfileHomePhoneObjectV2()
    /// The google object of user's profile
    public var google: HATProfileDataProfileGoogleObjectV2 = HATProfileDataProfileGoogleObjectV2()
    /// The age object of user's profile
    public var age: HATProfileDataProfileAgeObjectV2 = HATProfileDataProfileAgeObjectV2()
    /// The persoal info object of user's profile
    public var personal: HATProfileDataProfilePersonalObjectV2 = HATProfileDataProfilePersonalObjectV2()
    /// The blog object of user's profile
    public var blog: HATProfileDataProfileBlogObjectV2 = HATProfileDataProfileBlogObjectV2()
    /// The facebook object of user's profile
    public var facebook: HATProfileDataProfileFacebookObjectV2 = HATProfileDataProfileFacebookObjectV2()
    /// The address details object of user's profile
    public var address_details: HATProfileDataProfileAddressDetailObjectV2 = HATProfileDataProfileAddressDetailObjectV2()
    /// The emergency contact object of user's profile
    public var emergency_contact: HATProfileDataProfileEmergencyContactObjectV2 = HATProfileDataProfileEmergencyContactObjectV2()
    /// The alternative email address object of user's profile
    public var alternative_email: HATProfileDataProfileAlternativeEmailObjectV2 = HATProfileDataProfileAlternativeEmailObjectV2()
    /// The facebook profile photo object of user's profile
    public var fb_profile_photo: HATProfileDataProfileFacebookProfilePhotoObjectV2 = HATProfileDataProfileFacebookProfilePhotoObjectV2()
    /// The twitter object of user's profile
    public var twitter: HATProfileDataProfileTwitterObjectV2 = HATProfileDataProfileTwitterObjectV2()
    /// The about object of user's profile
    public var about: HATProfileDataProfileAboutObjectV2 = HATProfileDataProfileAboutObjectV2()
    /// The mobile phone number object of user's profile
    public var mobile: HATProfileDataProfileMobileObjectV2 = HATProfileDataProfileMobileObjectV2()
    /// The gender object of user's profile
    public var gender: HATProfileDataProfileGenderObjectV2 = HATProfileDataProfileGenderObjectV2()
    public var dateCreated: Int = 0
    public var `private`: Bool = true
}
