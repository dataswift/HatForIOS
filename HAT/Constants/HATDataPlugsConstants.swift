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

public protocol HATDataPlug {
    
    /// The name of the table that HAT saves data
    static var name: String { get set }
    /// The source name of the plug
    static var source: String { get set }
    
    /**
     Constructs the `api/status` endpoint for the plug according to the dataplug url returned from the HAT
     
     - parameter dataPlugURL: The plug url returned from HAT
     
     - returns: The `dataPlugURL` parameter appended with `/api/status`
     */
    static func checkStatusURL(dataPlugURL: String) -> String
}

extension HATDataPlug {
    
    public static func checkStatusURL(dataPlugURL: String) -> String {
        
        return "\(dataPlugURL)/api/status"
    }
}

/**
 The data needed for communicating with twitter data plug
 */
public struct Twitter: HATDataPlug {
    
    public static var name: String = "tweets"
    public static var source: String = "twitter"
}

/**
 The strings needed for communicating with spotify data plug
 */
public struct Spotify: HATDataPlug {
    
    public static var name: String = "spotify"
    public static var source: String = "spotify"
}

/**
 The strings needed for communicating with fitbit data plug
 */
public struct Fitbit: HATDataPlug {
    
    public static var name: String = "fitbit"
    public static var source: String = "Fitbit"
}

/**
 The strings needed for communicating with facebook data plug
 */
public struct Facebook: HATDataPlug {
    
    public static var name: String = "feed"
    public static var source: String = "facebook"
}

/**
 The strings needed for communicating with google calendar data plug
 */
public struct GoogleCalendar: HATDataPlug {
    
    public static var name: String = "google/events"
    public static var source: String = "calendar"
}
