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

// MARK: Struct

/// A class representing the outer `Data Plug` JSON format
public struct HATDataPlugObject: HATObject {

    // MARK: - Variables

    /// The unique id of the `Data Plug`
    public var plug: HATDataPlugPlugObject = HATDataPlugPlugObject()
    /// The provider of the `Data Plug`
    public var provider: HATDataPlugProviderObject = HATDataPlugProviderObject()
}
