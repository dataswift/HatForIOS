//
//  HATNotesV2AuthorObject.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 17/12/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

struct HATNotesV2AuthorObject: HATObject {

    // MARK: - Variables
    
    /// the nickname of the author
    public var nickname: String?
    /// the name of the author
    public var name: String?
    /// the photo url of the author
    public var photo_url: String?
    /// the phata of the author. Required
    public var phata: String = ""
    
    /// the id of the author
    public var authorID: Int?
}
