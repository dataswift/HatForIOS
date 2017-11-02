//
//  HATProfileDataProfileTwitterObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileTwitterObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileTwitterObject, is private
    public var `private`: Bool = true
    
    /// The link to user's twitter account
    public var link: String = ""
}
