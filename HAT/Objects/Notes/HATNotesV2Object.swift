//
//  HATNotesV2Object.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 17/12/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

struct HATNotesV2Object: HATObject {

    // MARK: - Variables
    
    /// the author data
    public var authorv1: HATNotesV2AuthorObject = HATNotesV2AuthorObject()
    
    /// the photo data
    public var photov1: HATNotesV2PhotoObject?
    
    /// the location data
    public var locationData: HATNotesV2LocationObject?
    
    /// creation date
    public var created_time: String = ""
    /// the date until this note will be public (don't know if it's optional or not)
    public var public_until: String?
    /// the updated time of the note
    public var updated_time: String = ""
    
    /// if true this note is shared to facebook etc.
    public var shared: Bool = false
    
    /// If shared, where is it shared? Coma seperated string (don't know if it's optional or not)
    public var shared_on: [String] = []
    /// the actual message of the note
    public var message: String = ""
    /// the kind of the note. 3 types available note, blog or list
    public var kind: String = ""
}
