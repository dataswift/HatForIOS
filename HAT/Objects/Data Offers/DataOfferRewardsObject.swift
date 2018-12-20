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

public struct DataOfferRewardsObject {
    
    // MARK: - JSON Fields
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `rewardType` in JSON is `rewardType`
     * `rewardVendor` in JSON is `vendor`
     * `vendorURL` in JSON is `vendorUrl`
     * `rewardValue` in JSON is `value`
     * `currency` in JSON is `currency`
     * `codesReuseable` in JSON is `codesReuseable`
     * `codes` in JSON is `codes`
     * `cashValue` in JSON is `cashValue`
     */
    enum Fields {
        
        static let rewardType: String = "rewardType"
        static let rewardVendor: String = "vendor"
        static let vendorURL: String = "vendorUrl"
        static let rewardValue: String = "value"
        static let currency: String = "currency"
        static let codesReuseable: String = "codesReuseable"
        static let codes: String = "codes"
        static let cashValue: String = "cashValue"
    }
    
    // MARK: - Variables
    
    /// The reward type of the offer. Can be `cash`, `voucher` or `service`
    public var rewardType: String = ""
    /// The vendor of the offer
    public var vendor: String = ""
    /// The vendor URL, possibly the website of the vendor
    public var vendorURL: String = ""
    /// The reward value of the offer
    public var value: Int = 0
    /// The reward value of the offer as Int
    public var valueInt: Int?
    /// Is the code of the reward able to be reused, in case of `voucher` type
    public var areCodesReusable: Bool?
    /// The possible codes as rewards, in case of `voucher` type
    public var codes: [String]?
    /// The cash value of the reward, in case of `cash` type
    public var cashValue: DataOfferRewardsCashValueObject?
    /// The currency of the reward, in case of `cash` type
    public var currency: String?
    
    // MARK: - Initialiser
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        rewardType = ""
        vendor = ""
        vendorURL = ""
        value = 0
        valueInt = nil
        areCodesReusable = nil
        codes = nil
        cashValue = nil
        currency = nil
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempRewardType: String = dictionary[DataOfferRewardsObject.Fields.rewardType]?.string {
            
            rewardType = tempRewardType
        }
        
        if let tempVendor: String = dictionary[DataOfferRewardsObject.Fields.rewardVendor]?.string {
            
            vendor = tempVendor
        }
        
        if let tempVendorUrl: String = dictionary[DataOfferRewardsObject.Fields.vendorURL]?.string {
            
            vendorURL = tempVendorUrl
        }
        
        if let tempValue: Int = dictionary[DataOfferRewardsObject.Fields.rewardValue]?.int {
            
            value = tempValue
        }
        
        if let tempCurrency: String = dictionary[DataOfferRewardsObject.Fields.currency]?.string {
            
            currency = tempCurrency
        }
        
        if let tempIntValue: Int = dictionary[DataOfferRewardsObject.Fields.rewardValue]?.int {
            
            valueInt = tempIntValue
        }
        
        if let tempCodeReusable: Bool = dictionary[DataOfferRewardsObject.Fields.codesReuseable]?.bool {
            
            areCodesReusable = tempCodeReusable
        }
        
        if let tempCodesArray: [JSON] = dictionary[DataOfferRewardsObject.Fields.codes]?.array {
            
            codes = []
            for code: JSON in tempCodesArray {
                
                if let unwrappedCode: String = code.string {
                    
                    codes?.append(unwrappedCode)
                }
            }
        }
        
        if let tempCashValue: [String: JSON] = dictionary[DataOfferRewardsObject.Fields.cashValue]?.dictionary {
            
            cashValue = DataOfferRewardsCashValueObject(dictionary: tempCashValue)
        }
    }
}
