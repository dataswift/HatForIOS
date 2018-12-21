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
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `conditions` in JSON is `conditions`
     * `bundle` in JSON is `bundle`
     */
    private enum CodingKeys: String, CodingKey {
        
        case conditions
        case bundle
    }
    // MARK: - Variables
    
    /// The conditions for `DataDebitValuesObject`. It can be nil
    public var conditions: [String: Bool]?
    /// The bundle for `DataDebitValuesObject`. It can be nil
    public var bundle: [String: [DataDefinitionBundleKeyEndpoints]]?
    
    // MARK: - Initialiazer
    
    /**
     Initializing an empty `DataDebitValuesObject`
     */
    public init() {
        
    }
}
