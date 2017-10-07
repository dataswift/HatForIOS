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
import SwiftyJSON

// MARK: Struct

public struct HATFitbitService {
    
    // MARK: - Get Fitbit Data

    /**
     <#Function Details#>
     
     - parameter <#Parameter#>: <#Parameter description#>
     */
    public func getFitbitEndpoints(successCallback: @escaping ([JSON], String?) -> Void,  errorCallback: @escaping (HATTableError) -> Void) {
        
        let url = "https://dex.hubofallthings.com/stats/available-data"
        
        HATNetworkHelper.asynchronousRequest(
            url,
            method: .get,
            encoding: Alamofire.URLEncoding.default,
            contentType: ContentType.JSON,
             parameters: [:],
             headers: [:],
             completion: { response in
            
                switch response {
                    
                case .error(let error, let statusCode):
                    
                    if error.localizedDescription == "The request timed out." {
                        
                        errorCallback(.noInternetConnection)
                    } else {
                        
                        let message = NSLocalizedString("Server responded with error", comment: "")
                        errorCallback(.generalError(message, statusCode, error))
                    }
                case .isSuccess(let isSuccess, _, let result, let token):
                    
                    if isSuccess {
                        
                        if let array = result.array {
                            
                            for item in array {
                                
                                if item["namespace"] == "fitbit" {
                                    
                                    print("yeah")
                                }
                            }
                            
                            successCallback(array, token)
                        } else {
                            
                            errorCallback(.noValuesFound)
                        }
                    }
                }
            }
        )
    }
}
