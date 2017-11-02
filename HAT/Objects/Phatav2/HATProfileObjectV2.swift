//
//  HATProfileObjectV2.swift
//  HAT
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import UIKit

public struct HATProfileObjectV2: HATObject {

    public var endpoint: String = ""
    public var recordId: String = ""
    public var data: HATProfileDataObjectV2 = HATProfileDataObjectV2()
}
