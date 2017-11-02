//
//  HATProfileDataProfileBlogObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileDataProfileBlogObjectV2: Codable, HATObject {

    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileBlogObject, is private
    public var `private`: Bool = true
    
    /// Link to user's profile in blog
    public var link: String = ""
}
