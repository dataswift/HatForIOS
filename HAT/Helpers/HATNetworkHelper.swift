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

// MARK: struct

/// All network related methods
public struct HATNetworkHelper {
    
    // MARK: - Request methods
    
    /**
     Makes ansychronous JSON request
     Closure for caller to handle
     
     - parameter url: The URL to connect to
     - parameter method: The method to use in connecting with the URL
     - parameter encoding: The encoding to use in the request
     - parameter contentType: The content type of the request
     - parameter parameters: The parameters in the request
     - parameter headers: The headers in the request
     - parameter completion: The completion handler to execute upon completing the request
     */
    public static func asynchronousRequest( _ url: String, method: HTTPMethod, encoding: ParameterEncoding, contentType: String, parameters: Dictionary<String, Any>, headers: Dictionary<String, String>, completion: @escaping (Result<(JSON, String?)>) -> Void) {
        
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager: SessionManager = Alamofire.SessionManager(configuration: configuration)
        // do a post
        manager.request(
            url, /* request url */
            method: method, /* GET, POST, etc*/
            parameters: parameters, /* parameters to POST*/
            encoding: encoding, /* encoding type, JSON, URLEncoded, etc*/
            headers: headers /* request header */
            )
            .responseJSON { response in
                
                let maybeErrors = HATNetworkHelper.checkForErrors(response: response)
                
                switch maybeErrors {
                    
                case .success:
                    
                    let header: [AnyHashable: Any]? = response.response?.allHeaderFields
                    let token: String? = header?[RequestHeaders.xAuthToken] as? String
                    
                    // check if we have a value and return it
                    guard let value: Any = response.result.value else {
                        
                        completion(.failure(HATTableError.noValuesFound))
                        return
                    }
                    
                    completion(.success((JSON(value), token)))
                case .failure(let error):
                    
                    completion(.failure(error))
                }
            }
            .session.finishTasksAndInvalidate()
    }
    
    static func checkForErrors(response: DataResponse<Any>) -> Result<Bool> {
        
        let value = response.result.value as? [String: String]
        switch response.result {
        case .success:
            
            if response.response?.statusCode == 401 {
                
                return .failure(AuthenicationError.tokenValidationFailed("expired"))
            } else if response.response?.statusCode == 403 {
                
                return .failure(AuthenicationError.tokenValidationFailed("forbidden"))
            } else if 200 ... 299 ~= response.response!.statusCode {
                
                return .success(true)
            } else {
                
                return .failure(HATError.generalError("Unexpected Error", response.response?.statusCode, nil, value))
            }
        // in case of failure return the error but check for internet connection or unauthorised status and let the user know
        case .failure(let error):
            
            if error.localizedDescription == "The request timed out." || error.localizedDescription == "The Internet connection appears to be offline." {
                
                return .failure(HATError.noInternetConnection)
            } else {
                
                let message: String = NSLocalizedString("Server responded with error", comment: "")
                return .failure(HATError.generalError(message, response.response?.statusCode, error, value))
            }
        }
    }
    
    /**
     Makes ansychronous string request
     Closure for caller to handle
     
     - parameter url: The URL to connect to
     - parameter method: The method to use in connecting with the URL
     - parameter encoding: The encoding to use in the request
     - parameter contentType: The content type of the request
     - parameter parameters: The parameters in the request
     - parameter headers: The headers in the request
     - parameter completion: The completion handler to execute upon completing the request
     */
    public static func asynchronousStringRequest(_ url: String, method: HTTPMethod, encoding: ParameterEncoding, contentType: String, parameters: Dictionary<String, Any>, headers: Dictionary<String, String>, completion: @escaping (Result<(String, String?)>) -> Void) {
        
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager: SessionManager = Alamofire.SessionManager(configuration: configuration)
        
        // do a post
        manager.request(
            url, /* request url */
            method: method, /* GET, POST, etc*/
            parameters: parameters, /* parameters to POST*/
            encoding: encoding, /* encoding type, JSON, URLEncoded, etc*/
            headers: headers /* request header */
            )
            .validate(statusCode: 200..<300)
            .validate(contentType: [contentType])
            .responseString { response in
                
                switch response.result {
                case .success:
                    
                    let header: [AnyHashable: Any]? = response.response?.allHeaderFields
                    let token: String? = header?[RequestHeaders.xAuthToken] as? String
                    
                    // check if we have a value and return it
                    guard let value: String = response.result.value else {
                        
                        completion(.failure(HATError.generalError("Unexpected Error", response.response?.statusCode, nil, nil)))
                        return
                    }
                    
                    completion(.success((value, token)))
                // return the error
                case .failure(let error):
                    
                    let valueToReturn: [String: String]
                    if response.result.value != nil {
                        
                        valueToReturn = ["description": response.result.value!]
                    } else {
                        
                        valueToReturn = [:]
                    }
                    completion(.failure(HATError.generalError("Unexpected Error", response.response?.statusCode, error, valueToReturn)))
                }
            }
            .session.finishTasksAndInvalidate()
    }
    
    // MARK: - Upload file
    
    /**
     Uploads a specified file to the url provided
     
     - parameter image: A `Data` type representation of the image in order to upload it
     - parameter url: The url to upload the file to
     - parameter contentType: The content type of the file to upload
     - parameter progressUpdateHandler: A function to execute in order to get the percentage of the upload completed so far
     - parameter completion: A function to execute if everything is ok
     */
    public static func uploadFile(image: Data, url: String, contentType: String, progressUpdateHandler: ((Double) -> Void)?, completion: @escaping (_ r: Result<(JSON, String?)>) -> Void) {
        
        let headers: [String: String] = [RequestHeaders.serverEncryption: RequestHeaders.serverEncryptionAES256, "Content-type": contentType]
        
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        let manager: SessionManager = Alamofire.SessionManager(configuration: configuration)
        
        manager.upload(
            image,
            to: URL(string: url)!,
            method: .put,
            headers: headers)
            .uploadProgress { progress -> Void in
                
                progressUpdateHandler?(progress.fractionCompleted)
            }
            .responseString { response in
                
                switch response.result {
                case .success:
                    
                    let header: [AnyHashable: Any]? = response.response?.allHeaderFields
                    let token: String? = header?[RequestHeaders.xAuthToken] as? String
                    
                    // check if we have a value and return it
                    guard let value: String = response.result.value else {
                        
                        completion(.failure(HATError.generalError("Unexpected Error", response.response?.statusCode, nil, nil)))
                        return
                    }
                    
                    let json = JSON(value)
                    completion(.success((json, token)))
                // return the error
                case .failure(let error):
                    
                    completion(.failure(HATError.generalError("Unexpected Error", response.response?.statusCode, error, nil)))
                }
            }
            .session.finishTasksAndInvalidate()
    }
    
    // MARK: - Query from string
    
    /**
     Gets a param value from a url
     
     - parameter url: The url to extract the parameters from
     - parameter param: The parameter
     
     - returns: String or nil if not found
     */
    public static func getQueryStringParameter(url: String?, param: String) -> String? {
        
        if let url: String = url, let urlComponents: NSURLComponents = NSURLComponents(string: url), let queryItems: [URLQueryItem] = (urlComponents.queryItems) {
            
            let parameter: URLQueryItem? = queryItems.first { item in item.name == param }
            return parameter?.value
        }
        
        return nil
    }
}
