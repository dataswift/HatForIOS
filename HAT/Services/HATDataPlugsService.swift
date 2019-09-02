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

/// The data plugs service class
public struct HATDataPlugsService {
    
    // MARK: - Data debits
    
    /**
     Approve data debit
     
     - parameter dataDebitID: The data debit ID as a String
     - parameter userToken: The user's token
     - parameter userDomain: The user's domain
     - parameter succesfulCallBack: A function to call if everything is ok
     - parameter failCallBack: A function to call if fail
     */
    public static func approveDataDebit(_ dataDebitID: String, userToken: String, userDomain: String, succesfulCallBack: @escaping (String) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        // setup parameters and headers
        let parameters: Dictionary<String, String> = [:]
        let headers: [String: String] = [RequestHeaders.xAuthToken: userToken]
        
        // contruct the url
        let url: String = "https://\(userDomain)/api/v2.6/data-debit/\(dataDebitID)/enable"
        
        // make async request
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.json,
            parameters: parameters,
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
            
                switch response {
                    
                case .failure(let error):
                    
                    switch error {
                    case is HATError:
                        
                        guard let hatError = error as? HATError else { return }
                        switch hatError {
                        case .generalError(_, let statusCode, _, _):
                            
                            guard statusCode != 400 else {
                                
                                failCallBack(DataPlugError.offerClaimed)
                                succesfulCallBack("enabled")
                                return
                            }
                            failCallBack(error)
                        default:
                            
                            failCallBack(error)
                        }
                    default:
                        
                        failCallBack(error)
                    }
                case .success(let result):
                    
                    if !result.0["confirmed"].boolValue {
                        
                        succesfulCallBack(result.0["dataDebitId"].stringValue)
                    } else {
                        
                        failCallBack(DataPlugError.generalError(NSLocalizedString("Couldn't find dataDebitId value", comment: ""), nil, nil, nil))
                    }
                }
        }
    }
    
    /**
     Check if data debit with this ID is enabled or not
     
     - parameter dataDebitID: The data debit ID as a String
     - parameter userToken: The user's token
     - parameter userDomain: The user's domain
     - parameter succesfulCallBack: A function to call if everything is ok
     - parameter failCallBack: A function to call if fail
     */
    public static func checkDataDebit(_ dataDebitID: String, userToken: String, userDomain: String, succesfulCallBack: @escaping (Bool) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        // setup parameters and headers
        let parameters: Dictionary<String, String> = [:]
        let headers: [String: String] = [RequestHeaders.xAuthToken: userToken]
        
        // contruct the url
        let url: String = "https://\(userDomain)/api/v2.6/data-debit/\(dataDebitID)"
        
        // make async request
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.json,
            parameters: parameters,
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
            
                switch response {
                    
                case .failure(let error):
                    
                    switch error {
                    case is HATError:
                        
                        guard let hatError = error as? HATError else { return }
                        switch hatError {
                        case .generalError(_, let statusCode, _, _):
                            
                            if statusCode == 404 {
                                
                                failCallBack(DataPlugError.generalError(NSLocalizedString("Expected response, 404", comment: ""), statusCode, error, nil))
                            } else {
                                
                                failCallBack(error)
                            }
                        default:
                            
                            failCallBack(error)
                        }
                    default:
                        
                        failCallBack(error)
                    }
                case .success(let result):
                    
                    guard let dataDebit: HATDataDebit = HATDataDebit.decode(from: result.0.dictionaryValue) else {
                        
                        failCallBack(DataPlugError.generalError(NSLocalizedString("Could not parse Data debit", comment: ""), nil, nil, nil))
                        return
                    }
                    
                    succesfulCallBack(dataDebit.isActive)
                }
        }
    }
    
    //
    
    /**
     Check social plug expiry date
     
     - parameter facebookUrlStatus: The plug's status url to connect to
     - parameter succesfulCallBack: A function to call if everything is ok
     - parameter failCallBack: A function to call if fail
     */
    public static func checkSocialPlugExpiry(facebookUrlStatus: String, succesfulCallBack: @escaping (String) -> Void, failCallBack: @escaping (Error) -> Void) -> (_ appToken: String) -> Void {
        
        return { (appToken: String) in
            
            // setup parameters and headers
            let parameters: Dictionary<String, String> = [:]
            let headers: [String: String] = [RequestHeaders.xAuthToken: appToken]
            
            // make async request
            HATNetworkHelper.asynchronousRequest(
                facebookUrlStatus,
                method: .get,
                encoding: Alamofire.URLEncoding.default,
                contentType: ContentType.json,
                parameters: parameters,
                headers: headers) { (response: Result<(JSON, String?)>) -> Void in
                
                    switch response {
                        
                    case .failure(let error):
                        
                        failCallBack(error)
                    case .success(let result):
                        
                        succesfulCallBack(String(result.0["expires"].stringValue))
                    }
            }
        }
    }
    
}
