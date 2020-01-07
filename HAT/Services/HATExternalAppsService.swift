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

import Alamofire
import SwiftyJSON

// MARK: Struct

public struct HATExternalAppsService {
    
    // MARK: - Get external apps
    
    /**
     Gets the apps from HAT
     
     - parameter userToken: The user's token, required to complete this request
     - parameter userDomain: The user's domain, required to complete this request
     - parameter completion: A function to execute on success with the apps and the new token
     - parameter failCallBack: A function to execute on fail that takes the error produced
     */
    public static func getExternalApps(userToken: String, userDomain: String, completion: @escaping (([HATExternalApplications], String?) -> Void), failCallBack: @escaping ((HATTableError) -> Void)) {
        
        let url: String = "https://\(userDomain)/api/v2.6/applications"
        let headers: [String: String] = ["x-auth-token": userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.text,
            parameters: [:],
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
                
                switch response {
                    
                case .failure(let error):
                    
                    if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                        
                        failCallBack(.noInternetConnection)
                    } else {
                        
                        let message: String = NSLocalizedString("Server responded with error", comment: "")
                        failCallBack(.generalError(message, nil, error, nil))
                    }
                case .success(let result):
                    
                    if let array: [JSON] = result.0.array {
                        
                        var arrayToReturn: [HATExternalApplications] = []
                        
                        for item: JSON in array {
                            
                            if let object: HATExternalApplications = HATExternalApplications.decode(from: item.dictionaryValue) {
                                
                                arrayToReturn.append(object)
                            }
                        }
                        
                        completion(arrayToReturn, result.1)
                    }
                }
        }
    }
    
    // MARK: - Get external apps
    
    /**
     Gets the apps from HAT
     
     - parameter userToken: The user's token, required to complete this request
     - parameter userDomain: The user's domain, required to complete this request
     - parameter completion: A function to execute on success with the apps and the new token
     - parameter failCallBack: A function to execute on fail that takes the error produced
     */
    public static func getAppInfo(userToken: String, userDomain: String, applicationId: String, completion: @escaping ((HATExternalApplications, String?) -> Void), failCallBack: @escaping ((HATTableError) -> Void)) {
        
        let url: String = "https://\(userDomain)/api/v2.6/applications/\(applicationId)"
        let headers: [String: String] = ["x-auth-token": userToken, "Cache-Control": "no-cache"]

        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.text,
            parameters: [:],
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
                
                switch response {
                    
                case .failure(let error):
                    
                    if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                        
                        failCallBack(.noInternetConnection)
                    } else {
                        
                        let message: String = NSLocalizedString("Server responded with error", comment: "")
                        failCallBack(.generalError(message, nil, error, nil))
                    }
                case .success(let result):
                    
                    if let item: [String: JSON] = result.0.dictionary {
                        
                        if let object: HATExternalApplications = HATExternalApplications.decode(from: item) {
                            
                            completion(object, result.1)
                        }
                    }
                }
        }
    }
    
    // MARK: - Setup external apps
    
    /**
     Sets up the app
     
     - parameter userToken: The user's token, required to complete this request
     - parameter userDomain: The user's domain, required to complete this request
     - parameter applicationID: The application id, required to complete this request
     - parameter completion: A function to execute on success with the apps and the new token
     - parameter failCallBack: A function to execute on fail that takes the error produced
     */
    public static func setUpApp(userToken: String, userDomain: String, applicationID: String, completion: @escaping ((HATExternalApplications, String?) -> Void), failCallBack: @escaping ((HATTableError) -> Void)) {
        
        let url: String = "https://\(userDomain)/api/v2.6/applications/\(applicationID)/setup"
        let headers: [String: String] = ["x-auth-token": userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.text,
            parameters: [:],
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
                
                switch response {
                    
                case .failure(let error):
                    
                    if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                        
                        failCallBack(.noInternetConnection)
                    } else {
                        
                        let message: String = NSLocalizedString("Server responded with error", comment: "")
                        failCallBack(.generalError(message, nil, error, nil))
                    }
                case .success(let result):
                    
                    if let item: [String: JSON] = result.0.dictionary {
                        
                        if let object: HATExternalApplications = HATExternalApplications.decode(from: item) {
                            
                            completion(object, result.1)
                        }
                    }
                }
        }
    }
    
    // MARK: - Disable app
    
    /**
     Sets up the app
     
     - parameter userToken: The user's token, required to complete this request
     - parameter userDomain: The user's domain, required to complete this request
     - parameter applicationID: The application id, required to complete this request
     - parameter completion: A function to execute on success with the apps and the new token
     - parameter failCallBack: A function to execute on fail that takes the error produced
     */
    public static func disableApplication(appID: String, userDomain: String, userToken: String, completion: @escaping ((HATExternalApplications, String?) -> Void), failCallBack: @escaping ((HATTableError) -> Void)) {
        
        let url: String = "https://\(userDomain)/api/v2.6/applications/\(appID)/disable"
        let headers: [String: String] = ["x-auth-token": userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.text,
            parameters: [:],
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
                
                switch response {
                    
                case .failure(let error):
                    
                    if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                        
                        failCallBack(.noInternetConnection)
                    } else {
                        
                        let message: String = NSLocalizedString("Server responded with error", comment: "")
                        failCallBack(.generalError(message, nil, error, nil))
                    }
                case .success(let result):
                    
                    if let item: [String: JSON] = result.0.dictionary {
                        
                        if let object: HATExternalApplications = HATExternalApplications.decode(from: item) {
                            
                            completion(object, result.1)
                        }
                    }
                }
        }
    }
}
