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

public struct DataDefinitionObject: HATObject {
    
    // MARK: - Variables
    
    /// The name of the definition
    public var name: String = ""
    /// The requirements of the offer. Which endpoints and what fields it has access to
    public var bundle: Dictionary<String, DataDefinitionBundleKey> = [:]
    
    // MARK: - Initializer
    
    /**
     Initializing a `DataOfferRequiredDataDefinitionObjectV2` from specific values
     
     - parameter name: The name of the definition
     - parameter bundle: The bundle for the requirements of the offer. In which URLs it will have access and which fields
     */
    public init(name: String, bundle: Dictionary<String, DataDefinitionBundleKey>) {
        
        self.name = name
        self.bundle = bundle
    }
    
    /**
     Initializing an empty `DataOfferRequiredDataDefinitionObjectV2`
     */
    public init() {
        
    }
}
