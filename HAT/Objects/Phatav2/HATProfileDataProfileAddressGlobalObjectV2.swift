//
//  HATProfileDataProfileAddressGlobalObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileAddressGlobalObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileAddressGlobalObject, is private
    public var `private`: Bool = true 
    
    /// User's City
    public var city: String = ""
    
    /// User's Country
    public var country: String = ""
    
    /// User's County
    public var county: String = ""
}
