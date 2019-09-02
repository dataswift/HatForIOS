/**
 * Copyright (C) 2016-2019 Dataswift Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

// MARK: Headers

/**
 The request headers used in various network requests
 */
public enum RequestHeaders {
    
    // MARK: - Variables
    
    /// The `x-Auth-Token` name in the header, used to store the user's token
    public static let xAuthToken: String = "x-auth-token"
    /// The `token` name in the headers
    public static let tokenParamName: String = "token"
    /// The `x-amz-server-side-encryption` name in the headers
    public static let serverEncryption: String = "x-amz-server-side-encryption"
    /// The `AES256` value in the headers for `x-amz-server-side-encryption`
    public static let serverEncryptionAES256: String = "AES256"
}

// MARK: - Content type

/**
 The content type used in various network requests
 */
public enum ContentType {
    
    // MARK: - Variables
    
    /// The `application/json` content type
    public static let json: String = "application/json"
    /// The `text/plain` content type
    public static let text: String = "text/plain"
}
