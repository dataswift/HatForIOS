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

public struct DataOfferClaim {
    
    // MARK: - Coding Keys
    
    /// The names of the variables in the JSON received
    private enum CodingKeys: String, CodingKey {
        
        case claimStatus = "status"
        case claimConfirmed = "confirmed"
        case claimDateStamp = "dateCreated"
        case dataDebitID = "dataDebitId"
    }
    
    // MARK: - Variables
    
    /// The data offer claim status. Can be `confirmed`, `claimed` and `completed`
    public var claimStatus: String = ""
    /// A flag indicating if the claim was confirmed
    public var claimConfirmed: Bool = false
    /// The date that the offer has been claimed as a unix time stamp
    public var claimDateStamp: Int = -1
    /// The `Data Debit` id that the offer is attached to
    public var dataDebitID: String = ""
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        claimStatus = ""
        claimConfirmed = false
        claimDateStamp = -1
        dataDebitID = ""
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempStatus: String = dictionary[DataOfferClaim.CodingKeys.claimStatus.rawValue]?.string {
            
            claimStatus = tempStatus
        }
        
        if let tempConfirmed: Bool = dictionary[DataOfferClaim.CodingKeys.claimConfirmed.rawValue]?.bool {
            
            claimConfirmed = tempConfirmed
        }
        
        if let tempDataDebitID: String = dictionary[DataOfferClaim.CodingKeys.dataDebitID.rawValue]?.string {
            
            dataDebitID = tempDataDebitID
        }
        
        if let tempDateStamp: Int = dictionary[DataOfferClaim.CodingKeys.claimDateStamp.rawValue]?.int {
            
            claimDateStamp = tempDateStamp
        }
    }
}
