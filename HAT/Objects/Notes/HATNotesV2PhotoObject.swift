//
//  HATNotesV2PhotoObject.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 17/12/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

struct HATNotesV2PhotoObject: HATObject {

    // MARK: - Variables
    
    /// the link to the photo
    public var link: String?
    /// the source of the photo
    public var source: String?
    /// the caption of the photo
    public var caption: String?
    
    /// if photo is shared
    public var shared: Bool?
}
