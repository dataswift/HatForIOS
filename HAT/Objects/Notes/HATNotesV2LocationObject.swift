//
//  HATNotesV2LocationObject.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 17/12/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

struct HATNotesV2LocationObject: HATObject {

    // MARK: - Variables
    
    /// the altitude the at time of creating the note. This value is optional
    public var altitude: Double?
    /// the altitude accuracy at the time of creating the note. This value is optional
    public var altitudeAccuracy: Double?
    /// the latitude at the time of creating the note
    public var latitude: Double?
    /// the accuracy at the time of creating the note
    public var accuracy: Double?
    /// the longitude at the time of creating the note
    public var longitude: Double?
    /// the speed at the time of creating the note. This value is optional
    public var speed: Double?
    
    /// the heading at the time of creating the note. This value is optinal
    public var heading: String?
    
    /// is the location shared at the time of creating the note? This value is optional.
    public var shared: Bool?
}
