/**
 * Copyright (C) 2019 HAT Data Exchange Ltd
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
import SwiftyJSON

// MARK: Struct

/// A class about the methods concerning the HAT
public struct HATService {
    
    // MARK: - Application Token
    
    /**
     Gets the application level token from hat
     
     - parameter userDomain: The user's domain
     - parameter userToken: The user's token
     - parameter appName: The resource for the token
     - parameter succesfulCallBack: A function to call if everything is ok
     - parameter failCallBack: A function to call if fail
     */
    public static func getApplicationTokenFor(userDomain: String, userToken: String, appName: String, succesfulCallBack: @escaping (String, String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        // setup parameters and headers
        let headers: [String: String] = [RequestHeaders.xAuthToken: userToken]
        
        // contruct the url
        let url: String = "http://\(userDomain)/api/v2.6/applications/\(appName)/access-token"
        
        // async request
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
            
                switch response {
                    
                case .failure(let error):
                    
                    failCallBack(error)
                case .success(let result):
                    
                    succesfulCallBack(result.0["accessToken"].stringValue, result.1)
                }
        }
    }
    
    // MARK: - Validate Data
    
    /**
     Validates email address with the HAT
     
     - parameter email: The email to validate with the HAT
     - parameter cluster: The cluster to validate the email with
     - parameter succesfulCallBack: A function to call if everything is ok
     - parameter failCallBack: A function to call if fail
     */
    public static func validateEmailAddress(email: String, cluster: String, succesfulCallBack: @escaping (String, String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        let url: String = "https://hatters.hubofallthings.com/api/products/hat/validate-email"
        
        let parameters: [String: String] = ["email": email,
                                            "cluster": cluster]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.json,
            parameters: parameters,
            headers: [:]) {(response: Result<(JSON, String?)>) -> Void in
            
                switch response {
                    
                case .failure(let error):
                    
                    failCallBack(error)
                case .success(let result):
                    
                    succesfulCallBack("valid email", result.1)
                }
        }
    }
    
    /**
     Validates HAT address with HAT
     
     - parameter address: The address to validate with the HAT
     - parameter cluster: The cluster to validate the email with
     - parameter succesfulCallBack: A function to call if everything is ok
     - parameter failCallBack: A function to call if fail
     */
    public static func validateHATAddress(address: String, cluster: String, succesfulCallBack: @escaping (String, String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        let url: String = "https://hatters.hubofallthings.com/api/products/hat/validate-hat"
        
        let parameters: [String: String] = ["address": address,
                                            "cluster": cluster]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.json,
            parameters: parameters,
            headers: [:]) {(response: Result<(JSON, String?)>) -> Void in
            
                switch response {
                    
                case .failure(let error):
                    
                    failCallBack(error)
                case .success(let result):
                    
                    succesfulCallBack("valid address", result.1)
                }
        }
    }
    
    // MARK: - Get system status
    
    /**
     Fetches all the info related to user's HAT
     
     - parameter userDomain: The user's domain
     - parameter userToken: The user's token
     - parameter succesfulCallBack: A function to call if everything is ok
     - parameter failCallBack: A function to call if fail
     */
    public static func getSystemStatus(userDomain: String, userToken: String, completion: @escaping ([HATSystemStatus], String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        let url: String = "https://\(userDomain)/api/v2.6/system/status"
        let headers: [String: String] = ["X-Auth-Token": userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: headers) {(response: Result<(JSON, String?)>) -> Void in
            
                switch response {
                    
                case .failure(let error):
                    
                    failCallBack(error)
                case .success(let result):
                    
                    let resultArray: [JSON] = result.0.arrayValue
                    var arrayToSendBack: [HATSystemStatus] = []
                    for item: JSON in resultArray {
                        
                        arrayToSendBack.append(HATSystemStatus(from: item.dictionaryValue))
                    }
                    
                    completion(arrayToSendBack, result.1)
                }
        }
    }
}
