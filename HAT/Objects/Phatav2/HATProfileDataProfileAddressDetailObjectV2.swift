//
//  HATProfileDataProfileAddressDetailObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileAddressDetailObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileAddressDetailObject, is private
    public var `private`: Bool = true
    
    /// User's street address number
    public var no: String = ""
    
    /// User's street name
    public var street: String = ""
    
    /// User's post code
    public var postcode: String = ""
}
