/**
 * Copyright (C) 2018 HAT Data Exchange Ltd
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
import Mockingjay
import SwiftyJSON
import XCTest

internal class HATAccountServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTickle() {

        let body: [Dictionary<String, Any>] =
            [
                [
                    "lastUpdated": "2017-02-09T16:48:17.499Z",
                    "id": 31707,
                    "data": [
                        "notablesv1": [
                            "authorv1": [
                                "phata": "mariostsekis.hubofallthings.net"
                            ],
                            "public_until": "",
                            "shared_on": "",
                            "message": "web",
                            "kind": "note",
                            "created_time": "2017-02-09T16:17:07+00:00",
                            "shared": "false",
                            "updated_time": "2017-02-09T16:48:19+00:00"
                        ]
                    ],
                    "name": "2017-02-09T16:48:19.506Z"
                ]
        ]
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://notables.hubofallthings.com/api/bulletin/tickle?"
        let expectationTest = expectation(description: "Tickling hat...")

        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))

        func completion() {

            XCTAssertTrue(true)
            expectationTest.fulfill()
        }

        func failed(error: HATTableError) {

            XCTFail()
            expectationTest.fulfill()
        }

        HATAccountService.triggerHatUpdate(userDomain: userDomain, completion: completion)

        waitForExpectations(timeout: 10) { error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testCreateValueOnHAT() {
        
        let parameters: Dictionary<String, Any> = ["newData": "true"]
        
        let body: [Dictionary<String, Any>] =
            [
                [
                    "lastUpdated": "2017-02-09T16:48:17.499Z",
                    "id": 31707,
                    "data": [
                        "newData": "true"
                    ],
                    "name": "2017-02-09T16:48:19.506Z"
                ]
        ]
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://mariostsekis.hubofallthings.net/api/v2/data/newdata/test"
        let expectationTest = expectation(description: "Create value on hat...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(json: JSON, newToken: String?) {
            
            let tempDict = json[0].dictionaryValue
            
            XCTAssert(tempDict["data"] == ["newData": "true"])
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATAccountService.createTableValue(userToken: "", userDomain: userDomain, namespace: "newdata", scope: "test", parameters: parameters, successCallback: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetValueOnHAT() {
        
        let body: [Dictionary<String, Any>] =
            [
                [
                    "lastUpdated": "2017-02-09T16:48:17.499Z",
                    "id": 31707,
                    "data": [
                        "newData": "true"
                    ],
                    "name": "2017-02-09T16:48:19.506Z"
                ]
        ]
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://mariostsekis.hubofallthings.net/api/v2/data/newdata/test"
        let expectationTest = expectation(description: "Get value from hat...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(json: [JSON], newToken: String?) {
            
            let tempDict = json[0].dictionaryValue
            
            XCTAssert(tempDict["data"] == ["newData": "true"])
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATAccountService.getHatTableValues(token: "", userDomain: userDomain, namespace: "newdata", scope: "test", parameters: [:], successCallback: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testDeleteValueOnHAT() {
        
        let parameters: [String: String] = ["records": "123-123"]
        let body: String = "All records Deleted!"
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://\(userDomain)/api/v2/data"
        let expectationTest = expectation(description: "Delete record from hat...")
        
        MockingjayProtocol.addStub(matcher: http(.delete, uri: urlToConnect), builder: json(body))
        
        func completion(response: String) {
            
            XCTAssert(response == "token")
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATAccountService.deleteHatRecord(userDomain: userDomain, userToken: "token", recordIds: ["123-123"], success: completion, failed: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testUpdateValueOnHAT() {
        
        let body: [[String: Any]] = [
            [
                "lastUpdated": "2017-02-09T16:48:17.499Z",
                "id": 31707,
                "data": [
                    "newData": "true"
                ],
                "name": "2017-02-09T16:48:19.506Z"
            ]
        ]
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://\(userDomain)/api/v2/data"
        let expectationTest = expectation(description: "Update record on hat...")
        
        MockingjayProtocol.addStub(matcher: http(.put, uri: urlToConnect), builder: json(body))
        
        func completion(json: [JSON], newToken: String?) {
            
            let tempDict = json[0].dictionaryValue
            
            XCTAssert(tempDict["data"] == ["newData": "true"])
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATAccountService.updateHatRecord(userDomain: userDomain, userToken: "", parameters: body[0], successCallback: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testChangePassword() {
        
        let body: [String: Any] = [
            
            "message": "Password changed"
        ]
        let parameters: [String: String] = ["oldpassword": "123", "newpassword": "321"]
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://\(userDomain)/control/v2/auth/password"
        let expectationTest = expectation(description: "Changing password...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(response: String, newToken: String?) {
            
            XCTAssert(response == "Password changed")
            expectationTest.fulfill()
        }
        
        func failed(error: HATError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATAccountService.changePassword(userDomain: userDomain, userToken: "", oldPassword: "123", newPassword: "321", successCallback: completion, failCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testCombinatorCreation() {
        
        let body: [String: Any] = [
            
            "message": "Combinator created"
        ]
        let userDomain: String = "mariostsekis.hubofallthings.net"
        let combinatorName: String = "testcombinator"
        let urlToConnect = "https://\(userDomain)/api/v2/combinator/\(combinatorName)"
        let expectationTest = expectation(description: "Create a combinator...")
        
        MockingjayProtocol.addStub(matcher: http(.post, uri: urlToConnect), builder: json(body))
        
        func completion(isCreated: Bool, newToken: String?) {
            
            XCTAssert(isCreated)
            expectationTest.fulfill()
        }
        
        func failed(error: HATError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATAccountService.createCombinator(userDomain: userDomain, userToken: "", endPoint: "test/endpoint", combinatorName: combinatorName, fieldToFilter: "dateCreated", lowerValue: 0, upperValue: 5, successCallback: completion, failCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGettingCombinator() {
        
        let body: [[String: Any]] = [[
            
            "message": "Combinator created"
        ]]
        let userDomain: String = "mariostsekis.hubofallthings.net"
        let combinatorName: String = "testcombinator"
        let urlToConnect = "https://\(userDomain)/api/v2/combinator/\(combinatorName)"
        let expectationTest = expectation(description: "Create a combinator...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(json: [JSON], newToken: String?) {
            
            XCTAssert(!json.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: HATError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATAccountService.getCombinator(userDomain: userDomain, userToken: "", combinatorName: combinatorName, successCallback: completion, failCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testDomainURL() {

        let userDomain = "mariostsekis.hubofallthings.net"
        let expectedURL = "https://" + userDomain + "/publickey"
        let returnedURL = HATAccountService.theUserHATDomainPublicKeyURL(userDomain)

        XCTAssertEqual(returnedURL, expectedURL)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
