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

import UIKit

// MARK: Struct

public struct DataOfferRequiredDataDefinitionBundleFiltersV2: Codable {
    
    // MARK: - Variables
    
    /// the field to filter
    public var field: String = ""
    /// The transformation to be done on the field
    public var transformation: Dictionary<String, String>?
    /// The operator of the filter
    public var `operator`: HATOperator?
}

public class HATOperator: Codable {

    enum HATOperatorTypes: String, Decodable {
        
        case find = "find"
        case contains = "contains"
        case between = "between"
    }
    
    init() {
        
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case `operator`
    }
    
    var `operator`: String = ""
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.operator = try container.decode(String.self, forKey: .operator)
        let type = try container.decode(HATOperatorTypes.self, forKey: CodingKeys.operator)
        switch type {
            
        case .find, .contains:
            
            print("found drink")
            //try OperatorFind.decode(OperatorFind.self)
            break
        case .between:
            
            print("found between")
            break
        }
        

//
//        self.`operator` = try container.decode(String.self, forKey: .`operator`)
    }
    
    public func encode(to encoder: Encoder) throws {
        
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(true, forKey: .`operator`)
//        try container.encode(true, forKey: .value)
    }
}

public class OperatorIn: HATOperator {
    
    private enum CodingKeys: String, CodingKey {
        
        case value
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(Dictionary<String, String>.self, forKey: .value)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(true, forKey: .value)
        try super.encode(to: encoder)
    }
    
    init(operator: String, value: Dictionary<String, String>) {
        
        self.value = value
        super.init()
    }
    
    var value: Dictionary<String, String>
}

public class OperatorContains: HATOperator {

    private enum CodingKeys: String, CodingKey {
        
        case `operator`
        case value
    }
    
    init(operator: String, value: Bool) {

        self.value = value
        super.init()
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(Bool.self, forKey: .value)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(true, forKey: .value)
        try super.encode(to: encoder)
    }
    
    let value: Bool
}

public class OperatorBetween: HATOperator {
    
    private enum CodingKeys: String, CodingKey {
        
        case upper
        case lower
    }
    
    init(operator: String, upper: Int, lower: Int) {
        
        self.upper = upper
        self.lower = lower
        super.init()
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.upper = try container.decode(Int.self, forKey: .upper)
        self.lower = try container.decode(Int.self, forKey: .lower)

        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(true, forKey: .upper)
        try container.encode(true, forKey: .lower)
        try super.encode(to: encoder)
    }
    
    let upper: Int
    let lower: Int
}

public class OperatorFind: HATOperator {
    
    private enum CodingKeys: String, CodingKey {
        
        case search
    }
    
    init(operator: String, search: String) {
        
        self.search = search
        super.init()
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.search = try container.decode(String.self, forKey: .search)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(true, forKey: .search)
        try super.encode(to: encoder)
    }
    
    let search: String
}
