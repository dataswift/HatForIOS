//
//  HATProfileDataProfileEmergencyContactObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileEmergencyContactObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileEmergencyContactObject, is private
    public var `private`: Bool = true
    
    /// The first name of the user's emergency contact
    public var first_name: String = ""
    
    /// The last name of the user's emergency contact
    public var last_name: String = ""
    
    /// The user's relationship with the emergency contact
    public var relationship: String = ""
    
    /// The mobile number of the user's emergency contact
    public var mobile: String = ""
}
