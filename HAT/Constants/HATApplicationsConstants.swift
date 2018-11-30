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

public protocol HATApplication {
    
    /// The name of the table that HAT saves data
    static var name: String { get set }
    /// The source name of the application
    static var source: String { get set }
}

/**
 The strings needed for communicating with notables service
 */
public enum Notables: HATApplication {
    
    public static var name: String = "notablesv1"
    public static var source: String = "rumpel"
}

/**
 The strings needed for generating databuyer token
 */
public struct DataBuyer: HATApplication {
    
    public static var name: String = "DataBuyer"
    public static var source: String = "https://databuyer.hubat.net/"
}

/**
 The strings needed for generating Dex token
 */
public struct Dex: HATApplication {
    
    public static var name: String = "Dex"
    public static var source: String = "https://dex.hubofallthings.com/"
}
