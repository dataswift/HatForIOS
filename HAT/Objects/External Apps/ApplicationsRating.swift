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

// MARK: Struct

public struct ApplicationsRating: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `score` in JSON is `score`
     */
    private enum CodingKeys: String, CodingKey {
        
        case score
    }
    
    // MARK: - Variables
    
    /// The rating of the app, determined during app review by the HAT team. You can learn more about rating [here.](https://www.hatcommunity.org/hat-dex-rating)
    public var score: String = ""
}
