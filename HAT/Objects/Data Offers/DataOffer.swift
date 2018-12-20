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

import SwiftyJSON

// MARK: Struct

public struct DataOffer {
    
    // MARK: - CodingKeys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `dataOfferID` in JSON is `id`
     * `createdDate` in JSON is `created`
     * `offerTitle` in JSON is `title`
     * `shortDescription` in JSON is `shortDescription`
     * `longDescription` in JSON is `longDescription`
     * `imageURL` in JSON is `illustrationUrl`
     * `offerStarts` in JSON is `starts`
     * `offerExpires` in JSON is `expires`
     * `collectsDataFor` in JSON is `collectFor`
     * `minimumUsers` in JSON is `requiredMinUser`
     * `maximumUsers` in JSON is `requiredMaxUser`
     * `usersClaimedOffer` in JSON is `totalUserClaims`
     * `requiredDataDefinitions` in JSON is `requiredDataDefinition`
     * `dataConditions` in JSON is `dataConditions`
     * `dataRequirements` in JSON is `dataRequirements`
     * `reward` in JSON is `reward`
     * `owner` in JSON is `owner`
     * `claim` in JSON is `claim`
     * `pii` in JSON is `pii`
     * `merchantCode` in JSON is `merchantCode`
     */
    private enum CodingKeys: String, CodingKey {
        
        case dataOfferID = "id"
        case dateCreated = "created"
        case offerTitle = "title"
        case shortDescription = "shortDescription"
        case longDescription = "longDescription"
        case imageURL = "illustrationUrl"
        case startDate = "starts"
        case expireDate = "expires"
        case collectsDataFor = "collectFor"
        case minimumUsers = "requiredMinUser"
        case maximumUsers = "requiredMaxUser"
        case usersClaimedOffer = "totalUserClaims"
        case requiredDataDefinitions = "requiredDataDefinition"
        case dataConditions = "dataConditions"
        case dataRequirements = "dataRequirements"
        case reward = "reward"
        case owner = "owner"
        case claim = "claim"
        case isPΙIRequested = "pii"
        case merchantCode = "merchantCode"
    }
    
    // MARK: - Variables
    
    /// The data offer ID
    public var dataOfferID: String = ""
    /// The title of the offer
    public var offerTitle: String = ""
    /// The short description of the offer, usually 1 phrase
    public var shortDescription: String = ""
    /// The long description of the offer, usuallu 1 small paragraph stating more info about the offer and the reward
    public var longDescription: String = ""
    /// The image URL of the offer in order to fetch it
    public var imageURL: String = ""
    /// The merchant code of the offer, this is how you can ask for offers from a specific merchants. Any merchant ending in `public` is visible to everyone. Some merchants can be private only
    public var merchantCode: String = ""
    
    /// the date created as unix time stamp
    public var dateCreated: String = ""
    /// the start date of the offer as unix time stamp
    public var startDate: String = ""
    /// the expire date of the offer as unix time stamp
    public var expireDate: String = ""
    /// the duration that the offer collects data for as unix time stamp
    public var collectsDataFor: Int = -1
    /// the minimum users required for the offer to activate
    public var minimumUsers: Int = -1
    /// the max users of the offer. If this number is reached no one else can claim the offer
    public var maximumUsers: Int = -1
    /// the number of users claimed the offer so far
    public var usersClaimedOffer: Int = -1
    
    /// the data definition object of the offer
    public var requiredDataDefinition: DataDefinitionObject?
    
    /// the data conditions object of the offer
    public var dataConditions: DataDefinitionObject?
    
    /// the data requirements object of the offer
    public var dataRequirements: DataDefinitionObject?
    
    /// the rewards of the offer
    public var reward: DataOfferRewardsObject = DataOfferRewardsObject()
    
    /// The owner of the offer
    public var owner: DataOfferOwner = DataOfferOwner()
    
    /// The claim object of the offer
    public var claim: DataOfferClaim = DataOfferClaim()
    
    /// The downloaded image of the offer, used to cache the image once downloaded
    public var image: UIImage?
    
    /// A flag indicating if the offer requires pii, personal identifying information
    public var isPΙIRequested: Bool = false
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        dataOfferID  = ""
        offerTitle = ""
        shortDescription = ""
        longDescription = ""
        imageURL = ""
        merchantCode = ""
        
        dateCreated = ""
        startDate = ""
        expireDate = ""
        collectsDataFor = -1
        minimumUsers = -1
        maximumUsers = -1
        usersClaimedOffer = -1
        
        requiredDataDefinition = nil
        dataConditions = nil
        dataRequirements = nil
        
        reward = DataOfferRewardsObject()
        
        owner = DataOfferOwner()
        
        claim = DataOfferClaim()
        
        image = nil
        
        isPΙIRequested = false
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempID: String = dictionary[DataOffer.CodingKeys.dataOfferID.rawValue]?.string {
            
            dataOfferID = tempID
        }
        
        if let tempCreated: String = dictionary[DataOffer.CodingKeys.dateCreated.rawValue]?.string {
            
            dateCreated = tempCreated
        }
        
        if let tempTitle: String = dictionary[DataOffer.CodingKeys.offerTitle.rawValue]?.string {
            
            offerTitle = tempTitle
        }
        
        if let tempShortDescription: String = dictionary[DataOffer.CodingKeys.shortDescription.rawValue]?.string {
            
            shortDescription = tempShortDescription
        }
        
        if let tempLongDescription: String = dictionary[DataOffer.CodingKeys.longDescription.rawValue]?.string {
            
            longDescription = tempLongDescription
        }
        
        if let tempIllustrationUrl: String = dictionary[DataOffer.CodingKeys.imageURL.rawValue]?.string {
            
            imageURL = tempIllustrationUrl
        }
        
        if let tempMerchantCode: String = dictionary[DataOffer.CodingKeys.merchantCode.rawValue]?.string {
            
            merchantCode = tempMerchantCode
        }
        
        if let tempOfferStarts: String = dictionary[DataOffer.CodingKeys.startDate.rawValue]?.string {
            
            startDate = tempOfferStarts
        }
        
        if let tempOfferExpires: String = dictionary[DataOffer.CodingKeys.expireDate.rawValue]?.string {
            
            expireDate = tempOfferExpires
        }
        
        if let tempCollectOfferFor: Int = dictionary[DataOffer.CodingKeys.collectsDataFor.rawValue]?.int {
            
            collectsDataFor = tempCollectOfferFor
        }
        
        if let tempRequiresMinUsers: Int = dictionary[DataOffer.CodingKeys.minimumUsers.rawValue]?.int {
            
            minimumUsers = tempRequiresMinUsers
        }
        
        if let tempRequiresMaxUsers: Int = dictionary[DataOffer.CodingKeys.maximumUsers.rawValue]?.int {
            
            maximumUsers = tempRequiresMaxUsers
        }
        
        if let tempUserClaims: Int = dictionary[DataOffer.CodingKeys.usersClaimedOffer.rawValue]?.int {
            
            usersClaimedOffer = tempUserClaims
        }
        
        if let tempPII: Bool = dictionary[DataOffer.CodingKeys.isPΙIRequested.rawValue]?.bool {
            
            isPΙIRequested = tempPII
        }
        
        if let tempRequiredDataDefinition: JSON = dictionary[DataOffer.CodingKeys.requiredDataDefinitions.rawValue] {
            
            let decoder: JSONDecoder = JSONDecoder()
            do {
                
                let data: Data = try tempRequiredDataDefinition.rawData()
                requiredDataDefinition = try decoder.decode(DataDefinitionObject.self, from: data)
            } catch {
                
                print(error)
            }
        }
        
        if let tempDataConditions: JSON = dictionary[DataOffer.CodingKeys.dataConditions.rawValue] {
            
            let decoder: JSONDecoder = JSONDecoder()
            do {
                
                let data: Data = try tempDataConditions.rawData()
                dataConditions = try decoder.decode(DataDefinitionObject.self, from: data)
            } catch {
                
                print(error)
            }
        }
        
        if let tempDataRequirements: JSON = dictionary[DataOffer.CodingKeys.dataRequirements.rawValue] {
            
            let decoder: JSONDecoder = JSONDecoder()
            do {
                
                let data: Data = try tempDataRequirements.rawData()
                dataRequirements = try decoder.decode(DataDefinitionObject.self, from: data)
            } catch {
                
                print(error)
            }
        }
        
        if let tempReward: [String: JSON] = dictionary[DataOffer.CodingKeys.reward.rawValue]?.dictionary {
            
            reward = DataOfferRewardsObject(dictionary: tempReward)
        }
        
        if let tempOwner: [String: JSON] = dictionary[DataOffer.CodingKeys.owner.rawValue]?.dictionary {
            
            owner = DataOfferOwner(dictionary: tempOwner)
        }
        
        if let tempClaim: [String: JSON] = dictionary[DataOffer.CodingKeys.claim.rawValue]?.dictionary {
            
            claim = DataOfferClaim(dictionary: tempClaim)
        }
    }
    
}
