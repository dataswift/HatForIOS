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

public struct HATLocationsV2DataObject: HATObject {

    public var latitude: Float = 0
    public var longitude: Float = 0
    public var dateCreated: Int = 0
    public var dateCreatedLocal: String = ""
    public var speed: Float?
    public var floor: Int?
    public var verticalAccuracy: Float?
    public var horizontalAccuracy: Float?
    public var altitude: Float?
    public var course: Float?
}
