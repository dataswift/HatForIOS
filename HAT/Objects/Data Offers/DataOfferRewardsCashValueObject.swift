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

public struct DataOfferRewardsCashValueObject {

    // MARK: - JSON Fields
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `rewardType` in JSON is `rewardType`
     * `currency` in JSON is `currency`
     * `value` in JSON is `value`
     */
    public struct Fields {
        
        static let rewardType: String = "rewardType"
        static let currency: String = "currency"
        static let value: String = "value"
    }
    
    // MARK: - Variables
    
    /// The reward type of the offer. Can be `cash`, `voucher` or `service`
    public var rewardType: String = ""
    /// The value of the reward
    public var value: Int = 0
    /// The currency of the reward
    public var currency: String = ""
    
    // MARK: - Initialiser
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        rewardType = ""
        value = 0
        currency = ""
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempRewardType: String = dictionary[DataOfferRewardsCashValueObject.Fields.rewardType]?.string {
            
            rewardType = tempRewardType
        }
        
        if let tempValue: Int = dictionary[DataOfferRewardsCashValueObject.Fields.value]?.int {
            
            value = tempValue
        }
        
        if let tempCurrency: String = dictionary[DataOfferRewardsCashValueObject.Fields.currency]?.string {
            
            currency = tempCurrency
        }
    }
}
