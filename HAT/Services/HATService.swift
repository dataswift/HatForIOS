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

import Alamofire

class HATService: NSObject {
    
    // MARK: - Application Token
    
    /**
     Gets the application level token from hat
     
     - parameter serviceName: The service name requesting the token
     - parameter resource: The resource for the token
     - parameter succesfulCallBack: A function to call if everything is ok
     - parameter failCallBack: A function to call if fail
     */
    class func getApplicationTokenFor(serviceName: String, userDomain: String, token: String, resource: String, succesfulCallBack: @escaping (String) -> Void, failCallBack: @escaping (JSONParsingError) -> Void) -> Void {
        
        // setup parameters and headers
        let parameters = ["name" : serviceName, "resource" : resource]
        let headers = [RequestHeaders.xAuthToken: token]
        
        // contruct the url
        let url = "https://" + userDomain + "/users/application_token?"
        
        // async request
        NetworkHelper.AsynchronousRequest(url, method: .get, encoding: Alamofire.URLEncoding.default, contentType: ContentType.JSON, parameters: parameters, headers: headers, completion: { (r: NetworkHelper.ResultType) -> Void in
            
            switch r {
                
            // in case of error call the failCallBack
            case .error(let error, let statusCode):
                
                let message = NSLocalizedString("Server responded with error", comment: "")
                failCallBack(.generalError(message, statusCode, error))
            // in case of success call the succesfulCallBack
            case .isSuccess(let isSuccess, let statusCode, let result):
                
                if isSuccess {
                    
                    succesfulCallBack(result["accessToken"].stringValue)
                } else {
                    
                    failCallBack(.generalError(isSuccess.description, statusCode, nil))
                }
            }
        })
    }
    
}
