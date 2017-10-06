//
//  HATDataPlugProviderObject.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 6/10/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATDataPlugProviderObject: Decodable {

    public var id: String = ""
    public var email: String = ""
    public var emailConfirmed: Bool = false
    public var password: String = ""
    public var name: String = ""
    public var dateCreated: Int = 0
}
