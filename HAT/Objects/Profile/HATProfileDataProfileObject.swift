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

/// A struct representing the profile object from the received profile JSON file
public struct HATProfileDataProfileObject: Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: HATProfileDataProfileObject, rhs: HATProfileDataProfileObject) -> Bool {
        
        return (lhs.isPrivate == rhs.isPrivate && lhs.website == rhs.website && lhs.nick == rhs.nick && lhs.primaryEmail == rhs.primaryEmail && lhs.youtube == rhs.youtube && lhs.addressGlobal == rhs.addressGlobal && lhs.linkedIn == rhs.linkedIn && lhs.birth == rhs.birth && lhs.homePhone == rhs.homePhone && lhs.google == rhs.google && lhs.age == rhs.age && lhs.personal == rhs.personal && lhs.blog == rhs.blog && lhs.facebook == rhs.facebook && lhs.addressDetails == rhs.addressDetails && lhs.emergencyContact == rhs.emergencyContact && lhs.alternativeEmail == rhs.alternativeEmail && lhs.facebookProfilePhoto == rhs.facebookProfilePhoto && lhs.twitter == rhs.twitter && lhs.about == rhs.about && lhs.mobile == rhs.mobile && lhs.gender == rhs.gender)
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
    public static func <(lhs: HATProfileDataProfileObject, rhs: HATProfileDataProfileObject) -> Bool {
        
        return lhs.age < rhs.age
    }
    
    // MARK: - Variables

    /// Indicates if the object, HATProfileDataProfileObject, is private
    public var isPrivate: Bool = true
    
    /// The website object of user's profile
    public var website: HATProfileDataProfileWebsiteObject = HATProfileDataProfileWebsiteObject()
    /// The nickname object of user's profile
    public var nick: HATProfileDataProfileNickObject = HATProfileDataProfileNickObject()
    /// The primary email address object of user's profile
    public var primaryEmail: HATProfileDataProfilePrimaryEmailObject = HATProfileDataProfilePrimaryEmailObject()
    /// The youtube object of user's profile
    public var youtube: HATProfileDataProfileYoutubeObject = HATProfileDataProfileYoutubeObject()
    /// The global addres object of user's profile
    public var addressGlobal: HATProfileDataProfileAddressGlobalObject = HATProfileDataProfileAddressGlobalObject()
    /// The linkedIn object of user's profile
    public var linkedIn: HATProfileDataProfileLinkedInObject = HATProfileDataProfileLinkedInObject()
    /// The birth date object of user's profile
    public var birth: HATProfileDataProfileBirthObject = HATProfileDataProfileBirthObject()
    /// The home phone number object of user's profile
    public var homePhone: HATProfileDataProfileHomePhoneObject = HATProfileDataProfileHomePhoneObject()
    /// The google object of user's profile
    public var google: HATProfileDataProfileGoogleObject = HATProfileDataProfileGoogleObject()
    /// The age object of user's profile
    public var age: HATProfileDataProfileAgeObject = HATProfileDataProfileAgeObject()
    /// The persoal info object of user's profile
    public var personal: HATProfileDataProfilePersonalObject = HATProfileDataProfilePersonalObject()
    /// The blog object of user's profile
    public var blog: HATProfileDataProfileBlogObject = HATProfileDataProfileBlogObject()
    /// The facebook object of user's profile
    public var facebook: HATProfileDataProfileFacebookObject = HATProfileDataProfileFacebookObject()
    /// The address details object of user's profile
    public var addressDetails: HATProfileDataProfileAddressDetailObject = HATProfileDataProfileAddressDetailObject()
    /// The emergency contact object of user's profile
    public var emergencyContact: HATProfileDataProfileEmergencyContactObject = HATProfileDataProfileEmergencyContactObject()
    /// The alternative email address object of user's profile
    public var alternativeEmail: HATProfileDataProfileAlternativeEmailObject = HATProfileDataProfileAlternativeEmailObject()
    /// The facebook profile photo object of user's profile
    public var facebookProfilePhoto: HATProfileDataProfileFacebookProfilePhotoObject = HATProfileDataProfileFacebookProfilePhotoObject()
    /// The twitter object of user's profile
    public var twitter: HATProfileDataProfileTwitterObject = HATProfileDataProfileTwitterObject()
    /// The about object of user's profile
    public var about: HATProfileDataProfileAboutObject = HATProfileDataProfileAboutObject()
    /// The mobile phone number object of user's profile
    public var mobile: HATProfileDataProfileMobileObject = HATProfileDataProfileMobileObject()
    /// The gender object of user's profile
    public var gender: HATProfileDataProfileGenderObject = HATProfileDataProfileGenderObject()
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        isPrivate = true
        website = HATProfileDataProfileWebsiteObject()
        nick = HATProfileDataProfileNickObject()
        primaryEmail = HATProfileDataProfilePrimaryEmailObject()
        youtube = HATProfileDataProfileYoutubeObject()
        addressGlobal = HATProfileDataProfileAddressGlobalObject()
        linkedIn = HATProfileDataProfileLinkedInObject()
        birth = HATProfileDataProfileBirthObject()
        homePhone = HATProfileDataProfileHomePhoneObject()
        google = HATProfileDataProfileGoogleObject()
        age = HATProfileDataProfileAgeObject()
        personal = HATProfileDataProfilePersonalObject()
        blog = HATProfileDataProfileBlogObject()
        facebook = HATProfileDataProfileFacebookObject()
        addressDetails = HATProfileDataProfileAddressDetailObject()
        emergencyContact = HATProfileDataProfileEmergencyContactObject()
        alternativeEmail = HATProfileDataProfileAlternativeEmailObject()
        facebookProfilePhoto = HATProfileDataProfileFacebookProfilePhotoObject()
        twitter = HATProfileDataProfileTwitterObject()
        about = HATProfileDataProfileAboutObject()
        mobile = HATProfileDataProfileMobileObject()
        gender = HATProfileDataProfileGenderObject()
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
        
        if let tempWebsite = (dict["website"]?.dictionaryValue) {
            
            website = HATProfileDataProfileWebsiteObject(from: tempWebsite)
        }
        
        if let tempNick = (dict["nick"]?.dictionaryValue) {
            
            nick = HATProfileDataProfileNickObject(from: tempNick)
        }
        
        if let tempPrimaryEmail = (dict["primary_email"]?.dictionaryValue) {
            
            primaryEmail = HATProfileDataProfilePrimaryEmailObject(from: tempPrimaryEmail)
        }
        
        if let tempYoutube = (dict["youtube"]?.dictionaryValue) {
            
            youtube = HATProfileDataProfileYoutubeObject(from: tempYoutube)
        }
        
        if let tempAddressGlobal = (dict["address_global"]?.dictionaryValue) {
            
            addressGlobal = HATProfileDataProfileAddressGlobalObject(from: tempAddressGlobal)
        }
        
        if let tempLinkedIn = (dict["linkedin"]?.dictionaryValue) {
            
            linkedIn = HATProfileDataProfileLinkedInObject(from: tempLinkedIn)
        }
        
        if let tempBirth = (dict["birth"]?.dictionaryValue) {
            
            birth = HATProfileDataProfileBirthObject(from: tempBirth)
        }
        
        if let tempHomePhone = (dict["home_phone"]?.dictionaryValue) {
            
            homePhone = HATProfileDataProfileHomePhoneObject(from: tempHomePhone)
        }
        
        if let tempGoogle = (dict["google"]?.dictionaryValue) {
            
            google = HATProfileDataProfileGoogleObject(from: tempGoogle)
        }
        
        if let tempAge = (dict["age"]?.dictionaryValue) {
            
            age = HATProfileDataProfileAgeObject(from: tempAge)
        }
        
        if let tempPersonal = (dict["personal"]?.dictionaryValue) {
            
            personal = HATProfileDataProfilePersonalObject(from: tempPersonal)
        }
        
        if let tempBlog = (dict["blog"]?.dictionaryValue) {
            
            blog = HATProfileDataProfileBlogObject(from: tempBlog)
        }
        
        if let tempFacebook = (dict["facebook"]?.dictionaryValue) {
            
            facebook = HATProfileDataProfileFacebookObject(from: tempFacebook)
        }
        
        if let tempHomeAddressDetails = (dict["address_details"]?.dictionaryValue) {
            
            addressDetails = HATProfileDataProfileAddressDetailObject(from: tempHomeAddressDetails)
        }
        
        if let tempEmergencyContact = (dict["emergency_contact"]?.dictionaryValue) {
            
            emergencyContact = HATProfileDataProfileEmergencyContactObject(from: tempEmergencyContact)
        }
        
        if let tempAlternativeEmail = (dict["alternative_email"]?.dictionaryValue) {
            
            alternativeEmail = HATProfileDataProfileAlternativeEmailObject(from: tempAlternativeEmail)
        }
        
        if let tempFacebookProfilePhoto = (dict["fb_profile_photo"]?.dictionaryValue) {
            
            facebookProfilePhoto = HATProfileDataProfileFacebookProfilePhotoObject(from: tempFacebookProfilePhoto)
        }
        
        if let tempTwitter = (dict["twitter"]?.dictionaryValue) {
            
            twitter = HATProfileDataProfileTwitterObject(from: tempTwitter)
        }
        
        if let tempAbout = (dict["about"]?.dictionaryValue) {
            
            about = HATProfileDataProfileAboutObject(from: tempAbout)
        }
        
        if let tempMobile = (dict["mobile"]?.dictionaryValue) {
            
            mobile = HATProfileDataProfileMobileObject(from: tempMobile)
        }
        
        if let tempGender = (dict["gender"]?.dictionaryValue) {
            
            gender = HATProfileDataProfileGenderObject(from: tempGender)
        }
    }
    
}
