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

/**
 The data needed for communicating with twitter data plug, such as `tableName`, `sourceName` and `serviceName`
 */
public struct Twitter {
    
    /**
     Constructs the `api/status` endpoint for the plug according to the dataplug url returned from the HAT
     
     - parameter twitterDataPlugURL: The plug url returned from HAT
     
     - returns: The `twitterDataPlugURL` parameter appended with `/api/status`
     */
    public static func twitterDataPlugStatusURL(twitterDataPlugURL: String) -> String {
        
        return "\(twitterDataPlugURL)/api/status"
    }
    
    /// The name of the table that HAT saves data
    public static let tableName: String = "tweets"
    /// The source name of the plug
    public static let sourceName: String = "twitter"
    /// The service, Plug, name
    public static let serviceName: String = "Twitter"
}

/**
 The strings needed for communicating with spotify data plug
 */
public struct Spotify {
    
    /**
     Constructs the `api/status` endpoint for the plug according to the dataplug url returned from the HAT
     
     - parameter spotifyDataPlugURL: The plug url returned from HAT
     
     - returns: The `spotifyDataPlugURL` parameter appended with `/api/status`
     */
    public static func spotifyDataPlugStatusURL(spotifyDataPlugURL: String) -> String {
        
        return "\(spotifyDataPlugURL)/api/status"
    }
    
    /// The source name of the plug
    public static let sourceName: String = "spotify"
    /// The service, Plug, name
    public static let serviceName: String = "spotify"
}

/**
 The strings needed for communicating with fitbit data plug
 */
public struct Fitbit {
    
    /**
     Constructs the `api/status` endpoint for the plug according to the dataplug url returned from the HAT
     
     - parameter fitbitDataPlugURL: The plug url returned from HAT
     
     - returns: The `fitbitDataPlugURL` parameter appended with `/api/status`
     */
    public static func fitbitDataPlugStatusURL(fitbitDataPlugURL: String) -> String {
        
        return "\(fitbitDataPlugURL)/api/status"
    }
    
    /// The source name of the plug
    public static let sourceName: String = "fitbit"
    /// The service, Plug, name
    public static let serviceName: String = "Fitbit"
}

/**
 The strings needed for communicating with facebook data plug
 */
public struct Facebook {
    
    /**
     Constructs the `api/status` endpoint for the plug according to the dataplug url returned from the HAT
     
     - parameter facebookDataPlugURL: The plug url returned from HAT
     
     - returns: The `facebookDataPlugURL` paranter appended with `/api/status`
     */
    public static func facebookDataPlugStatusURL(facebookDataPlugURL: String) -> String {
        
        return "\(facebookDataPlugURL)/api/status"
    }
    
    /// The name of the table that HAT saves data
    public static let tableName: String = "feed"
    /// The source name of the plug
    public static let sourceName: String = "facebook"
    /// The service, Plug, name
    public static let serviceName: String = "Facebook"
}

/**
 The strings needed for communicating with google calendar data plug
 */
public struct GoogleCalendar {
    
    /**
     Constructs the `api/status` endpoint for the plug according to the dataplug url returned from the HAT
     
     - parameter googleDataPlugURL: The plug url returned from HAT
     
     - returns: The `googleDataPlugURL` parameter appended with `/api/status`
     */
    public static func googleCalendarDataPlugStatusURL(googleDataPlugURL: String) -> String {
        
        return "\(googleDataPlugURL)/api/status"
    }
    
    /// The name of the table that HAT saves data
    public static let tableName: String = "google/events"
    /// The source name of the plug
    public static let sourceName: String = "calendar"
    /// The service, Plug, name
    public static let serviceName: String = "calendar"
}

/**
 The strings needed for communicating with notables service
 */
public enum Notables {
    
    /// The name of the table that HAT saves data
    public static let tableName: String = "notablesv1"
    /// The source name of the plug
    public static let sourceName: String = "rumpel"
}

/**
 The strings needed for generating databuyer token
 */
public struct DataBuyer {
    
    /// The name of the service
    public static let name: String = "DataBuyer"
    /// The source of the service
    public static var source: String = "https://databuyer.hubat.net/"
}

/**
 The strings needed for generating Dex token
 */
public struct Dex {
    
    /// The name of the service
    public static let name: String = "Dex"
    /// The source of the service
    public static var source: String = "https://dex.hubofallthings.com/"
}

/**
 The request headers used in various network requests
 */
public enum RequestHeaders {
    
    /// The xAuthToken name in the headers
    public static let xAuthToken: String = "x-auth-token"
    /// The token name in the headers
    public static let tokenParamName: String = "token"
}

/**
 The content type used in various network requests
 */
public enum ContentType {
    
    /// The `application/json` content type
    public static let json: String = "application/json"
    /// The `text/plain` content type
    public static let text: String = "text/plain"
}

/**
 The authentication data used by location service
 */
public enum HATDataPlugCredentials {
    
    /// market data plug id used for location data plug
    static let dataPlugID: String = "c532e122-db4a-44b8-9eaf-18989f214262"
    /// market access token used for location data plug
    static let locationDataPlugToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxLVZTUDcrb0RleldPejBTOFd6MHhWM0J2eVNOYzViNnRcLzRKXC85TVlIWTQrVDdsSHdUSDRXMVVEWGFSVnVQeTFPZmtNajNSNDBjeTVERFRhQjZBNE44c3FGSTJmMUE1NzZUYjhiYmhhUT0iLCJpc3MiOiJoYXQtbWFya2V0IiwiZXhwIjoxNTI2OTc4OTkyLCJpYXQiOjE0OTYyMjA1OTIsImp0aSI6ImY0NTQ4NzI5MGRlZTA3NDI5YmQxMGViMWZmNzJkZjZmODdiYzhhZDE0ZThjOGE3NmMyZGJlMjVhNDlmODNkOTNiMDJhMzg3NGI4NTI0NDhlODU0Y2ZmZmE0ZWQyZGY1MTYyZTBiYzRhNDk2NGRhYTlhOTc1M2EyMjA1ZjIzMzc5NWY3N2JiODhlYzQwNjQxZjM4MTk4NTgwYWY0YmExZmJkMDg5ZTlhNmU3NjJjN2NhODlkMDdhOTg3MmY1OTczNjdjYWQyYzA0NTdjZDhlODlmM2FlMWQ2MmRmODY3NTcwNTc3NTdiZDJjYzgzNTgyOTU4ZmZlMDVhNjI2NzBmNGMifQ.TvFs6Zp0E24ChFqn3rBP-cpqxZbvkhph91UILGJvM6U"
}
