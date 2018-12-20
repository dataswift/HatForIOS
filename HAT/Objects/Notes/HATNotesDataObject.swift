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

public struct HATNotesDataObject: HATObject, HatApiType {
    
    // MARK: - JSON Fields
    
    /// The possible Fields of the JSON struct
    public struct Fields {
        
        static let authorV1: String = "authorv1"
        static let photoV1: String = "photov1"
        static let locationV1: String = "locationv1"
        static let createdTime: String = "created_time"
        static let publicUntil: String = "public_until"
        static let updatedTime: String = "updated_time"
        static let shared: String = "shared"
        static let currentlyShared: String = "currently_shared"
        static let sharedOn: String = "shared_on"
        static let message: String = "message"
        static let kind: String = "kind"
    }
    
    // MARK: - Coding Keys
    
    /// The names of the variables in the JSON received
    enum CodingKeys: String, CodingKey {
        
        case authorv1 = "authorv1"
        case photov1 = "photov1"
        case locationv1 = "locationv1"
        case createdTime = "created_time"
        case publicUntil = "public_until"
        case updatedTime = "updated_time"
        case shared = "shared"
        case currentlyShared = "currently_shared"
        case sharedOn = "shared_on"
        case message = "message"
        case kind = "kind"
    }
    
    // MARK: - Variables
    
    /// the author data
    public var authorv1: HATNotesAuthorObject = HATNotesAuthorObject()
    
    /// the photo data
    public var photov1: HATNotesPhotoObject?
    
    /// the location data
    public var locationv1: HATNotesLocationObject?
    
    /// creation date
    public var createdTime: String = ""
    /// the date until this note will be public (don't know if it's optional or not)
    public var publicUntil: String?
    /// the updated time of the note
    public var updatedTime: String = ""
    
    /// if true this note is shared to facebook etc.
    public var shared: Bool = false
    /// if true this note is shared to facebook etc.
    public var currentlyShared: Bool = false
    
    /// If shared, where is it shared? Coma seperated string (don't know if it's optional or not)
    public var sharedOn: [String] = []
    /// the actual message of the note
    public var message: String = ""
    /// the kind of the note. 3 types available note, blog or list
    public var kind: String = ""
    
    // MARK: - Initialiser
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public init(dict: Dictionary<String, JSON>) {
        
        self.init()
        
        self.inititialize(dict: dict)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        let tempDict: Dictionary<String, JSON>
        if let temp: [String: JSON] = dict["notablesv1"]?.dictionaryValue {
            
            tempDict = temp
        } else {
            
            tempDict = dict
        }
        
        if let tempAuthorData: [String: JSON] = tempDict[Fields.authorV1]?.dictionary {
            
            authorv1 = HATNotesAuthorObject.init(dict: tempAuthorData)
        }
        
        if let tempPhotoData: [String: JSON] = tempDict[Fields.photoV1]?.dictionary {
            
            photov1 = HATNotesPhotoObject.init(dict: tempPhotoData)
        }
        
        if let tempLocationData: [String: JSON] = tempDict[Fields.locationV1]?.dictionary {
            
            locationv1 = HATNotesLocationObject.init(dict: tempLocationData)
        }
        
        if let tempSharedOn: [JSON] = tempDict[Fields.sharedOn]?.arrayValue {
            
            for item: JSON in tempSharedOn {
                
                sharedOn.append(item.stringValue)
            }
        }
        
        if let tempPublicUntil: String = tempDict[Fields.publicUntil]?.string {
            
            publicUntil = tempPublicUntil
        }
        
        if let tempCreatedTime: String = tempDict[Fields.createdTime]?.string {
            
            createdTime = tempCreatedTime
        }
        
        if let tempUpdatedTime: String = tempDict[Fields.updatedTime]?.string {
            
            updatedTime = tempUpdatedTime
        }
        
        if let tempShared: Bool = tempDict[Fields.shared]?.boolValue {
            
            shared = tempShared
        }
        if let tempCurrentlyShared: Bool = tempDict[Fields.currentlyShared]?.boolValue {
            
            currentlyShared = tempCurrentlyShared
        }
        
        if let tempMessage: String = tempDict[Fields.message]?.string {
            
            message = tempMessage
        }
        
        if let tempKind: String = tempDict[Fields.kind]?.string {
            
            kind = tempKind
        }
    }
    
    // MARK: - HatApiType Protocol
    
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            Fields.authorV1: authorv1.toJSON(),
            Fields.photoV1: photov1?.toJSON() ?? HATNotesPhotoObject().toJSON(),
            Fields.locationV1: locationv1?.toJSON() ?? HATNotesLocationObject().toJSON(),
            Fields.createdTime: createdTime,
            Fields.publicUntil: publicUntil ?? "",
            Fields.updatedTime: updatedTime,
            Fields.shared: shared,
            Fields.currentlyShared: currentlyShared,
            Fields.sharedOn: sharedOn,
            Fields.message: message,
            Fields.kind: kind
        ]
    }
    
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let dictionary = JSON(fromCache)
        self.inititialize(dict: dictionary.dictionaryValue)
    }
}
