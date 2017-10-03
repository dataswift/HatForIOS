//
//  DataOfferRequiredDataDefinitionBundleFiltersV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 3/10/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct DataOfferRequiredDataDefinitionBundleFiltersV2: Codable {

    public var field: String = ""
    public var transformation: Dictionary<String, String> = [:]
    public var `operator`: Dictionary<String, String> = [:]
}
