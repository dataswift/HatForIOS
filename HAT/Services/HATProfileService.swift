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

import SwiftyJSON
import Alamofire

// MARK: Class

public class HATProfileService: NSObject {

    // MARK: - Get profile nationality
    
    /**
     Searches for profile table and fetches the entries
     
     - parameter userDomain: The user's HAT domain
     - parameter userToken: The user's token
     - parameter successCallback: A function to call on success
     - parameter failCallback: A fuction to call on fail
     */
    public class func getNationalityFromHAT(userDomain: String, userToken: String, successCallback: @escaping (HATNationalityObject) -> Void, failCallback: @escaping (HATTableError) -> Void) -> Void {
        
        func profileEntries(json: [JSON], renewedToken: String?) {
            
            // if we have values return them
            if json.count > 0 {
                
                let array = HATNationalityObject(from: json[0])
                successCallback(array)
            }
        }
        
        HATAccountService.getHatTableValuesv2(token: userToken, userDomain: userDomain, dataPath: "nationality", parameters: ["starttime" : "0"], successCallback: profileEntries, errorCallback: failCallback)
    }
}
