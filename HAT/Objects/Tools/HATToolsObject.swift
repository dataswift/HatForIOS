//
/**
 * Copyright (C) 2018 HAT Data Exchange Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

public struct HATToolsObject: HATObject {
    
    public var name: String = ""
    public var description: String = ""
    public var available: Bool = false
    public var enabled: Bool = false
    public var lastExecution: String?
    public var dataBundle: HATToolsDataBundleObject = HATToolsDataBundleObject()
    public var trigger: HATToolsTriggerObject = HATToolsTriggerObject()
}
