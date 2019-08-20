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

public struct HATDataOffersService {
    
    // MARK: - Get available data offers
    
    /**
     Gets the available data offers based on the merchants requested
     
     - parameter userDomain: The user's domain
     - parameter userToken: The user's token
     - parameter merchants: The merchants to get the offers from
     - parameter succesfulCallBack: A function of type ([DataOfferObject], String?) -> Void, executed on a successful result
     - parameter failCallBack: A function of type (Error) -> Void, executed on an unsuccessful result
     */
    public static func getAvailableDataOffers(userDomain: String, userToken: String, merchants: [String]?, succesfulCallBack: @escaping ([HATDataOffer], String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        let mutableURL: NSMutableString = NSMutableString(string: "https://\(userDomain)/api/v2.6/applications/databuyer/proxy/api/v2/offersWithClaims")
        if merchants != nil {
            
            for (index, merchant) in (merchants?.enumerated())! {
                
                if index == 0 {
                    
                    mutableURL.append("?")
                } else {
                    
                    mutableURL.append("&")
                }
                
                mutableURL.append("merchant=\(merchant)")
            }
        }
        
        let url: String = mutableURL as String
        let headers: Dictionary<String, String> = [RequestHeaders.xAuthToken: userToken]
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.JSONEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: headers) { (response: Result<(JSON, String?)>) -> Void in
            
                switch response {
                    
                case .failure(let error):
                    
                    failCallBack(error)
                case .success(let result):
                    
                    var returnValue: [HATDataOffer] = []
                    for item: JSON in result.0.arrayValue {
                        
                        returnValue.append(HATDataOffer(dictionary: item.dictionaryValue))
                    }
                    
                    succesfulCallBack(returnValue, result.1)
                }
        }
    }
    
    // MARK: - Claim offer
    
    /**
     Gets the available data plugs for the user to enable
     
     - parameter userDomain: The user's domain
     - parameter userToken: The user's token
     - parameter offerID: The offer id to claim
     - parameter succesfulCallBack: A function of type (String, String?) -> Void, executed on a successful result
     - parameter failCallBack: A function of type (Error) -> Void, executed on an unsuccessful result
     */
    public static func claimOffer(userDomain: String, userToken: String, offerID: String, succesfulCallBack: @escaping (String, String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        let url: String = "https://\(userDomain)/api/v2.6/applications/databuyer/proxy/api/v2/offer/\(offerID)/claim"
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
                    
                    let dictionaryResponse: [String: JSON] = result.0.dictionaryValue
                    if let claimed: String = dictionaryResponse["dataDebitId"]?.stringValue {
                        
                        succesfulCallBack(claimed, result.1)
                    } else {
                        
                        let message: String = NSLocalizedString("Could not parse dataDebitId", comment: "")
                        failCallBack(HATError.generalError(message, nil, nil, nil))
                    }
                }
        }
    }
    
    // MARK: - Redeem offer
    
    /**
     Redeems cash offer
     
     - parameter userDomain: The user's domain
     - parameter userToken: The user's token
     - parameter succesfulCallBack: A function to execute on successful response returning the server message and the renewed user's token
     - parameter failCallBack: A function to execute on failed response returning the error
     */
    public static func redeemOffer(userDomain: String, userToken: String, succesfulCallBack: @escaping (String, String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        let url: String = "https://\(userDomain)/api/v2.6/applications/databuyer/proxy/api/v2/user/redeem/cash"
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.json,
            parameters: [:],
            headers: [RequestHeaders.xAuthToken: userToken]) { (response: Result<(JSON, String?)>) -> Void in
                
                switch response {
                    
                case .failure(let error):
                    
                    failCallBack(error)
                case .success(let result):
                    
                    let dictionaryResponse: [String: JSON] = result.0.dictionaryValue
                    if let message: String = dictionaryResponse["message"]?.stringValue {
                        
                        succesfulCallBack(message, result.1)
                    }
                }
        }
    }
    
    // MARK: - Get Merchants
    
    /**
     Gets available merchants from HAT
     
     - parameter userToken: The users token
     - parameter userDomain: The user's domain name
     - parameter succesfulCallBack: A function to execute on successful response returning the merchants array and the renewed user's token
     - parameter failCallBack: A function to execute on failed response returning the error
     */
    public static func getMerchants(userToken: String, userDomain: String, succesfulCallBack: @escaping ([String], String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        let url: String = "https://\(userDomain)/api/v2/data/dex/databuyer"
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.json,
            parameters: ["take": 1, "orderBy": "date", "ordering": "descending"],
            headers: [RequestHeaders.xAuthToken: userToken]) { (response: Result<(JSON, String?)>) -> Void in
                
                switch response {
                    
                case .failure(let error):
                    
                    failCallBack(error)
                case .success(let result):
                    
                    if !result.0.arrayValue.isEmpty {
                        
                        let dictionaryResponse: [String: JSON] = result.0.arrayValue[0].dictionaryValue
                        if let tempDictionary: [String: JSON] = dictionaryResponse["data"]?.dictionaryValue, let merchants: [JSON] = tempDictionary["merchants"]?.arrayValue {
                                
                            var arrayToReturn: [String] = []
                            for merchant: JSON in merchants {
                                
                                if let merchantString: String = merchant.string {
                                    
                                    arrayToReturn.append(merchantString)
                                }
                            }
                            succesfulCallBack(arrayToReturn, result.1)
                        }
                    } else if result.0.arrayValue.isEmpty {
                        
                        succesfulCallBack([], result.1)
                    }
                }
        }
    }
    
    // MARK: - Claim offer wrapper
    
    /**
     Claims and enables the offer
     
     - parameter offer: The offer to claim and enable
     - parameter userDomain: The user's domain
     - parameter userToken: The user's token
     - parameter merchants: The merchants used to get the offer, defaults to an empty array
     - parameter succesfulCallBack: A function returning the new offer object and the the user's token
     - parameter failCallBack: A function executing of failure
     */
    public static func claimOfferWrapper(offer: HATDataOffer, userDomain: String, userToken: String, merchants: [String]? = [], succesfulCallBack: @escaping (HATDataOffer, String?) -> Void, failCallBack: @escaping (Error) -> Void) {
        
        func offerAccepted(status: String) {
            
            func filterOffers(offers: [HATDataOffer], newUserToken: String?) {
                
                let filteredOffer: [HATDataOffer] = offers.filter {
                    
                    $0.dataOfferID == offer.dataOfferID
                }
                
                guard !filteredOffer.isEmpty else {
                    
                    failCallBack(DataPlugError.noValueFound)
                    return
                }
                
                let offer: HATDataOffer = filteredOffer[0]
                succesfulCallBack(offer, newUserToken)
            }
            
            HATDataOffersService.getAvailableDataOffers(
                userDomain: userDomain,
                userToken: userToken,
                merchants: merchants,
                succesfulCallBack: filterOffers,
                failCallBack: failCallBack)
        }
        
        func success(dataDebitID: String, renewedUserToken: String?) {
            
            func dataDebitStatus(isEnabled: Bool) {
                
                if !isEnabled {
                    
                    HATDataPlugsService.approveDataDebit(
                        dataDebitID,
                        userToken: userToken,
                        userDomain: userDomain,
                        succesfulCallBack: offerAccepted,
                        failCallBack: failCallBack)
                } else {
                    
                    offerAccepted(status: "enabled")
                }
            }
            
            HATDataPlugsService.checkDataDebit(
                dataDebitID,
                userToken: userToken,
                userDomain: userDomain,
                succesfulCallBack: dataDebitStatus,
                failCallBack: failCallBack)
        }
        
        HATDataOffersService.claimOffer(
            userDomain: userDomain,
            userToken: userToken,
            offerID: offer.dataOfferID,
            succesfulCallBack: success,
            failCallBack: failCallBack)
    }
}
