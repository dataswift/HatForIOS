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

public struct HATDataDebitsService {
    
    // MARK: Get Data Debits
    
    /**
     Gets the available data debits for the user
     
     - parameter userToken: A String representing the user's token
     - parameter userDomain: A String representing the user's domain
     - parameter succesfulCallBack: A function of type ([HATDataDebit], String?) -> Void, executed on a successful result
     - parameter failCallBack: A function of type (Error) -> Void, executed on an unsuccessful result
     */
    public static func getAvailableDataDebits(userToken: String, userDomain: String, succesfulCallBack: @escaping ([HATDataDebit], String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        let url: String = "https://\(userDomain)/api/v2.6/data-debit"
        
        let headers: Dictionary<String, String> = [RequestHeaders.xAuthToken: userToken]
        
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
                    
                    var arrayToReturn: [HATDataDebit] = []
                    for item: JSON in result.0.arrayValue {
                        
                        guard let dataDebit: HATDataDebit = HATDataDebit.decode(from: item.dictionaryValue) else { continue }
                        
                        arrayToReturn.append(dataDebit)
                    }
                    
                    succesfulCallBack(arrayToReturn, result.1)
                }
        }
    }
    
    /**
     Gets the available data debits for the user
     
     - parameter userToken: A String representing the user's token
     - parameter userDomain: A String representing the user's domain
     - parameter succesfulCallBack: A function of type (HATDataDebit, String?) -> Void, executed on a successful result
     - parameter failCallBack: A function of type (Error) -> Void, executed on an unsuccessful result
     */
    public static func getDataDebit(dataDebitID: String, userToken: String, userDomain: String, succesfulCallBack: @escaping (HATDataDebit, String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        guard !dataDebitID.isEmpty else {
            
            failCallBack(HATError.generalError("Data debit empy", nil, nil, nil))
            return
        }
        
        let url: String = "https://\(userDomain)/api/v2.6/data-debit/\(dataDebitID)"
        
        let headers: Dictionary<String, String> = [RequestHeaders.xAuthToken: userToken]
        
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
                    
                    let item = result.0.dictionaryValue
                    guard let dataDebit: HATDataDebit = HATDataDebit.decode(from: item) else {
                        
                        failCallBack(JSONParsingError.generalError("Couldn't parse JSON for data debit", nil, nil, nil))
                        return
                    }
                    succesfulCallBack(dataDebit, result.1)
                }
        }
    }
    
    /**
     Gets the data debit values
     
     - parameter dataDebitID: A String representing the dataDebitID
     - parameter userToken: A String representing the user's token
     - parameter userDomain: A String representing the user's domain
     - parameter succesfulCallBack: A function of type (HATDataDebitValues, String) -> Void, executed on a successful result
     - parameter failCallBack: A function of type (Error) -> Void, executed on an unsuccessful result
     */
    public static func getDataDebitValues(dataDebitID: String, userToken: String, userDomain: String, succesfulCallBack: @escaping (HATDataDebitValues, String?) -> Void, failCallBack: @escaping (Error, String) -> Void) {
        
        let url: String = "https://\(userDomain)/api/v2.6/data-debit/\(dataDebitID)/values"
        
        let headers: Dictionary<String, String> = [RequestHeaders.xAuthToken: userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
                
                switch response {
                    
                case .failure(let error):
                    
                    failCallBack(error, dataDebitID)
                case .success(let result):
                    
                    let item = result.0.dictionaryValue
                    guard let dataDebitValues: HATDataDebitValues = HATDataDebitValues.decode(from: item) else {
                        
                        failCallBack(JSONParsingError.generalError("Couldn't parse JSON for data debit", nil, nil, nil), dataDebitID)
                        return
                    }
                    succesfulCallBack(dataDebitValues, result.1)
                }
        }
    }
    
    // MARK: - Disable data debit
    
    /**
     Disables the specified data debit
     
     - parameter dataDebitID: A String representing the data debit id to disable
     - parameter userToken: A String representing the user's token
     - parameter userDomain: A String representing the user's domain
     - parameter succesfulCallBack: A function of type (HATDataDebit, String?) -> Void, executed on a successful result
     - parameter failCallBack: A function of type (Error) -> Void, executed on an unsuccessful result
     */
    public static func disableDataDebit(dataDebitID: String, userToken: String, userDomain: String, succesfulCallBack: @escaping (HATDataDebit, String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        let url: String = "https://\(userDomain)/api/v2.6/data-debit/\(dataDebitID)/disable?atPeriodEnd=true"
        
        let headers: Dictionary<String, String> = [RequestHeaders.xAuthToken: userToken]
        
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
                    
                    let item = result.0.dictionaryValue
                    guard let dataDebit: HATDataDebit = HATDataDebit.decode(from: item) else {
                        
                        failCallBack(JSONParsingError.generalError("Couldn't parse JSON for data debit", nil, nil, nil))
                        return
                    }
                    succesfulCallBack(dataDebit, result.1)
                }
        }
    }
    
    // MARK: - Create data debit
    
    /**
     Creates a data debit for the user
     
     - parameter dataDebitID: The desired data debit id, this has to be unique
     - parameter bundle: The bundle structure for the data debit
     - parameter userToken: A String representing the user's token
     - parameter userDomain: A String representing the user's domain
     - parameter succesfulCallBack: A function of type (HATDataDebit, String?) -> Void, executed on a successful result
     - parameter failCallBack: A function of type (Error) -> Void, executed on an unsuccessful result
     */
    public static func createDataDebit(dataDebitID: String, bundle: HATDataDebitCreation, userToken: String, userDomain: String, succesfulCallBack: @escaping (HATDataDebit, String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        guard !dataDebitID.isEmpty else {
            
            failCallBack(HATError.generalError("Data debit empy", nil, nil, nil))
            return
        }
        
        let url: String = "https://\(userDomain)/api/v2.6/data-debit/\(dataDebitID)"
        
        let headers: Dictionary<String, String> = [RequestHeaders.xAuthToken: userToken]
        
        let temp = HATDataDebitCreation.encode(from: bundle)!
        let data = temp.compactMapValues { $0 }
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .post,
            encoding: Alamofire.JSONEncoding.default,
            contentType: ContentType.json,
            parameters: data,
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
                
                switch response {
                    
                case .failure(let error):
                    
                    failCallBack(error)
                case .success(let result):
                    
                    let item = result.0.dictionaryValue
                    guard let dataDebit: HATDataDebit = HATDataDebit.decode(from: item) else {
                        
                        failCallBack(JSONParsingError.generalError("Couldn't parse JSON for data debit", nil, nil, nil))
                        return
                    }
                    succesfulCallBack(dataDebit, result.1)
                }
        }
    }
}

extension Dictionary {
    
    func compactMapValues<U>( _ transform: (Value) throws -> U? ) rethrows -> [Key: U] {
        
        var result = [Key: U]()
        for (key, value) in self {
            
            result[key] = try transform(value)
        }
        
        return result
    }
}
