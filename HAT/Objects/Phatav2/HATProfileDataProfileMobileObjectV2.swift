//
//  HATProfileDataProfileMobileObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileMobileObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileMobileObject, is private
    public var `private`: Bool = true
    
    /// User's mobile phone number
    public var no: String = ""
}
