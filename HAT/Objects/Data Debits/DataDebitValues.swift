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

// MARK: - Struct

public struct DataDebitValues: HATObject {
    
    // MARK: - Coding Keys
    
    /// The names of the variables in the JSON received
    private enum CodingKeys: String, CodingKey {
        
        case conditions
        case bundle
    }
    // MARK: - Variables
    
    /// The conditions for `DataDebitValuesObject`. It can be nil
    public var conditions: [String: Bool]?
    /// The bundle for `DataDebitValuesObject`. It can be nil
    public var bundle: [String: [DataOfferRequiredDataDefinitionBundleKeyEndpointsV2]]?
    
    // MARK: - Initialiazer
    
    /**
     Initializing an empty `DataDebitValuesObject`
     */
    public init() {
        
    }
}
