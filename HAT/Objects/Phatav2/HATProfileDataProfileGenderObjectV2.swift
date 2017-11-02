//
//  HATProfileDataProfileGenderObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileGenderObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileGenderObject, is private
    public var `private`: Bool = true
    
    /// The user's gender
    public var type: String = ""
}
