//
//  HATProfileDataProfilePersonalObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfilePersonalObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfilePersonalObject, is private
    public var `private`: Bool = true
    
    /// User's first name
    public var first_name: String = ""
    
    /// User's last name
    public var last_name: String = ""
    
    /// User's middle name
    public var middle_name: String = ""
    
    /// User's preffered name
    public var preferred_name: String = ""
    
    /// User's title
    public var title: String = ""
}
