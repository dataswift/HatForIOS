//
//  HATProfileDataProfileAboutObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileAboutObjectV2: Codable, HATObject {

    /// The title of the about section
    public var title: String = ""
    
    /// The body of the about section
    public var body: String = ""
    
    /// Is private
    public var `private`: Bool = true
}
