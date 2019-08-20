//
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

public struct HATToolsService {

    public static func getAvailableTools(userDomain: String, userToken: String, completion: @escaping (([HATTools], String?) -> Void), failCallBack: @escaping ((HATTableError) -> Void)) {
        
        let url: String = "https://\(userDomain)/api/v2.6/she/function"
        let headers: [String: String] = ["x-auth-token": userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.JSONEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: headers) { response in
                
                switch response {
                    
                case .failure(let error):
                    
                    if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                        
                        failCallBack(.noInternetConnection)
                    } else {
                        
                        let message: String = NSLocalizedString("Server responded with error", comment: "")
                        failCallBack(.generalError(message, nil, error, nil))
                    }
                case .success(let result):
                    
                    var arrayToReturn: [HATTools] = []
                    
                    if let array: [JSON] = result.0.array {
                        
                        for item: JSON in array {
                            
                            if let object: HATTools = HATTools.decode(from: item.dictionaryValue) {
                                
                                arrayToReturn.append(object)
                            }
                        }
                        
                        completion(arrayToReturn, result.1)
                    }
                }
        }
    }
    
    public static func getTool(toolName: String, userDomain: String, userToken: String, completion: @escaping ((HATTools, String?) -> Void), failCallBack: @escaping ((HATTableError) -> Void)) {
        
        let url: String = "https://\(userDomain)/api/v2.6/she/function/\(toolName)"
        let headers: [String: String] = ["x-auth-token": userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.JSONEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: headers) {response in
                
                switch response {
                    
                case .failure(let error):
                    
                    if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                        
                        failCallBack(.noInternetConnection)
                    } else {
                        
                        let message: String = NSLocalizedString("Server responded with error", comment: "")
                        failCallBack(.generalError(message, nil, error, nil))
                    }
                case .success(let result):
                    
                    let dict: [String: JSON] = result.0.dictionaryValue
                    
                    if let object: HATTools = HATTools.decode(from: dict) {
                        
                        completion(object, result.1)
                    } else {
                        
                        let message: String = NSLocalizedString("Server response was unexpected", comment: "")
                        failCallBack(.generalError(message, nil, nil, nil))
                    }
                }
        }
    }
    
    public static func enableTool(toolName: String, userDomain: String, userToken: String, completion: @escaping ((HATTools, String?) -> Void), failCallBack: @escaping ((HATTableError) -> Void)) {
        
        let url: String = "https://\(userDomain)/api/v2.6/she/function/\(toolName)/enable"
        let headers: [String: String] = ["x-auth-token": userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.JSONEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: headers) {response in
                
                switch response {
                    
                case .failure(let error):
                    
                    if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                        
                        failCallBack(.noInternetConnection)
                    } else {
                        
                        let message: String = NSLocalizedString("Server responded with error", comment: "")
                        failCallBack(.generalError(message, nil, error, nil))
                    }
                case .success(let result):
                    
                    let dict: [String: JSON] = result.0.dictionaryValue
                    
                    if let object: HATTools = HATTools.decode(from: dict) {
                        
                        completion(object, result.1)
                    } else {
                        
                        let message: String = NSLocalizedString("Server response was unexpected", comment: "")
                        failCallBack(.generalError(message, nil, nil, nil))
                    }
                }
        }
    }
    
    public static func disableTool(toolName: String, userDomain: String, userToken: String, completion: @escaping ((HATTools, String?) -> Void), failCallBack: @escaping ((HATTableError) -> Void)) {
        
        let url: String = "https://\(userDomain)/api/v2.6/she/function/\(toolName)/disable"
        let headers: [String: String] = ["x-auth-token": userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.JSONEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: headers) {response in
                
                switch response {
                    
                case .failure(let error):
                    
                    if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                        
                        failCallBack(.noInternetConnection)
                    } else {
                        
                        let message: String = NSLocalizedString("Server responded with error", comment: "")
                        failCallBack(.generalError(message, nil, error, nil))
                    }
                case .success(let result):
                    
                    let dict: [String: JSON] = result.0.dictionaryValue
                    
                    if let object: HATTools = HATTools.decode(from: dict) {
                        
                        completion(object, result.1)
                    } else {
                        
                        let message: String = NSLocalizedString("Server response was unexpected", comment: "")
                        failCallBack(.generalError(message, nil, nil, nil))
                    }
                }
        }
    }
    
    public static func triggerToolUpdate(toolName: String, userDomain: String, userToken: String, completion: @escaping ((String, String?) -> Void), failCallBack: @escaping ((HATTableError) -> Void)) {
        
        let url: String = "https://\(userDomain)/api/v2.6/she/function/\(toolName)/trigger"
        let headers: [String: String] = ["x-auth-token": userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.JSONEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: headers) {response in
                
                switch response {
                    
                case .failure(let error):
                    
                    if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                        
                        failCallBack(.noInternetConnection)
                    } else {
                        
                        let message: String = NSLocalizedString("Server responded with error", comment: "")
                        failCallBack(.generalError(message, nil, error, nil))
                    }
                case .success(let result):
                    
                    let dict: [String: JSON] = result.0.dictionaryValue
                    if let message: String = dict["message"]?.stringValue {
                        
                        completion(message, result.1)
                    } else {
                        
                        let message: String = NSLocalizedString("Server response was unexpected", comment: "")
                        failCallBack(.generalError(message, nil, nil, nil))
                    }
                }
        }
    }
}
