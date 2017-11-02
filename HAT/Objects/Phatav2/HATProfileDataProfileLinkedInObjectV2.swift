//
//  HATProfileDataProfileLinkedInObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileLinkedInObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileLinkedInObject, is private
    public var `private`: Bool = true
    
    /// Link to user's profile in LinkedIn
    public var link: String = ""
}
