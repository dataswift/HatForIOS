//
//  HataDataPlugPlugObject.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 6/10/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATDataPlugPlugObject: Decodable {

    public var uuid: String = ""
    public var providerId: String = ""
    public var created: Int = 0
    public var name: String = ""
    public var description: String = ""
    public var url: String = ""
    public var illustrationUrl: String = ""
    public var passwordHash: String = ""
    public var approved: Bool = false
}
