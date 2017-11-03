/**
 * Copyright (C) 2017 HAT Data Exchange Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

public struct HATProfileObjectV2: HATObject {
    
    public var endpoint: String = ""
    public var recordId: String = ""
    public var data: HATProfileDataObjectV2 = HATProfileDataObjectV2()
    
    public init() {
        
    }
}
