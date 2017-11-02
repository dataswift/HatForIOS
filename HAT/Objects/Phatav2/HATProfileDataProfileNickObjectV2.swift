//
//  HATProfileDataProfileNickObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileNickObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileNickObject, is private
    public var `private`: Bool = true
    
    /// The user's nickname
    public var name: String = ""
}
