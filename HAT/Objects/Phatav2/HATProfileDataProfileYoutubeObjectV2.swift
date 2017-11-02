//
//  HATProfileDataProfileYoutubeObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileYoutubeObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileYoutubeObject, is private
    public var `private`: Bool = true
    
    /// Link to user's youtube profile
    public var link: String = ""
}
