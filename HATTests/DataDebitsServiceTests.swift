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

internal class DataDebitsServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetDataDebit() {
        
        let body: [Dictionary<String, Any?>] = [
            [
                "dataDebitKey": "8127e4c8-19e2-4e4e-aafb-1145bb175325",
                "dateCreated": "2017-09-28T14:21:15+0000",
                "permissions": [
                    [
                        "dateCreated": "2017-09-28T14:21:15+0000",
                        "purpose": "",
                        "start": "2017-09-28T14:21:38.000Z",
                        "period": 86400000,
                        "cancelAtPeriodEnd": true,
                        "termsUrl": "",
                        "bundle": [
                            "name": "8127e4c8-19e2-4e4e-aafb-1145bb175325",
                            "bundle": [
                                "facebook/posts": [
                                    "endpoints": [
                                        [
                                            "endpoint": "facebook/posts",
                                            "mapping": [
                                                "story": "data.story",
                                                "picture": "data.picture",
                                                "lastUpdated": "data.lastUpdated",
                                                "status_type": "data.status_type",
                                                "full_picture": "data.full_picture"
                                            ],
                                            "filters": [
                                                [
                                                    "field": "data.story",
                                                    "transformation": [
                                                        "transformation": "searchable"
                                                    ],
                                                    "operator": [
                                                        "search": "BBC",
                                                        "operator": "find"
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ],
                        "accepted": true,
                        "active": false,
                        "end": "2017-09-29T14:21:38.000Z"
                    ]
                ],
                "requestClientName": "",
                "requestClientUrl": "",
                "requestClientLogoUrl": "",
                "active": false,
                "accepted": false,
                "start": nil,
                "end": nil,
                "permissionsActive": nil,
                "permissionsLatest": [
                    "dateCreated": "2017-09-28T14:21:15+0000",
                    "purpose": "",
                    "start": "2017-09-28T14:21:38.000Z",
                    "period": 86400000,
                    "cancelAtPeriodEnd": true,
                    "termsUrl": "",
                    "bundle": [
                        "name": "8127e4c8-19e2-4e4e-aafb-1145bb175325",
                        "bundle": [
                            "facebook/posts": [
                                "endpoints": [
                                    [
                                        "endpoint": "facebook/posts",
                                        "mapping": [
                                            "story": "data.story",
                                            "picture": "data.picture",
                                            "lastUpdated": "data.lastUpdated",
                                            "status_type": "data.status_type",
                                            "full_picture": "data.full_picture"
                                        ],
                                        "filters": [
                                            [
                                                "field": "data.story",
                                                "transformation": [
                                                    "transformation": "searchable"
                                                ],
                                                "operator": [
                                                    "search": "BBC",
                                                    "operator": "find"
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ],
                    "accepted": true,
                    "active": false,
                    "end": "2017-09-29T14:21:38.000Z"
                ]
            ]
        ]
        
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://testing.hubat.net/api/v2.6/data-debit"
        let token: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaVkzSmxaR1Z1ZEdsaGJITWlMQ0p3Y205MmFXUmxja3RsZVNJNkluUmxjM1JwYm1jaWZRPT0iLCJyZXNvdXJjZSI6InRlc3RpbmcuaHViYXQubmV0IiwiYWNjZXNzU2NvcGUiOiJvd25lciIsImlzcyI6InRlc3RpbmcuaHViYXQubmV0IiwiZXhwIjoxNTA4NjY4MjMwLCJpYXQiOjE1MDg0MDkwMzAsImp0aSI6IjZmYTNiYTNmN2QyMzMwMzMwMmUxMTgwMDllNzBjMzZmNGZiMjk3ODQzNmU4MDI0NmJmNTdjNmRlYWE1MjgxZGZmNGQwNjFhY2U4MjY5YjRiOTI5N2Q5ZmMyYmJkZjk5NDE2NzJmMGQ5MGM1YzFhMTkyYjZlNjk0N2Y3OWIxYzZjM2E5MmNlMGZmYzIyYTExMmI1NDJlYWY3ZmNkNTEzYjUzMzU1YmU4NzZjMTc0NmZlN2JlNTE1NmNmMjkzNDA5MDcwMTk4OTliOWYxMjEzMTMyNjNjMzBjYjI3MmViZTgwMjI1MDg0YmFkOGNkNTgzMzZkOWQ4YzIzNDkzYWM1YzIifQ.cObRGNjdXfjfp9pd5SF2vS-gj5t7faEEdn5bVat1TvjnX60oQGdc55M80VuDaNXnTnLQOAL6x9YnWgDY1bnmRa0_4_W8553VmMbEWdQ6fDaeW9iLhkh-UYWpIlxexvdof8Vy7YwKTLseR0l7JhheWBQkugp7bAJ7ZTnAIDOfGDR02_i7cdASvJwbefIeSOahdx9DVPMUj1DRE2dq7cR2-eRqJyc09cITKtKu0fY8reHqRfc2151grGx7KxRNd2aBMnqJeNgscOZR13jshapmrDTo9SSpyo8Z6CKcoWj-_7NdHa-8ceJSZzL64JkRbvCX07HdpmAuSIHuAA0xuQIqlg"
        
        let expectationTest: XCTestExpectation = expectation(description: "Checking getting of data debits...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(dataDebits: [DataDebitObject], newToken: String?) {
            
            XCTAssertTrue(!dataDebits.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: DataPlugError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATDataDebitsService.getAvailableDataDebits(
            userToken: token,
            userDomain: userDomain,
            succesfulCallBack: completion,
            failCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetDataDebitValues() {
        
        let body: Dictionary<String, Any?> = [
            "conditions": [
                "rumpel/locations/ios": true
            ],
            "bundle": [
                "rumpel/locations/ios": [
                    [
                        "endpoint": "rumpel/locations/ios",
                        "recordId": "1e543725-02bb-4928-892b-89d6698e919d",
                        "data": [
                            "altitude": 0,
                            "latitude": 51.499053991408999,
                            "longitude": -0.17987330526600001,
                            "dateCreated": 1532440715,
                            "dateCreatedLocal": "2018-07-24T13:58:35Z",
                            "horizontalAccuracy": 5
                        ]
                    ],
                    [
                        "endpoint": "rumpel/locations/ios",
                        "recordId": "679c42a8-9557-494a-b933-fa597c5aaa5b",
                        "data": [
                            "altitude": 0,
                            "latitude": 51.497540302525003,
                            "longitude": -0.18333329941217,
                            "dateCreated": 1532440640,
                            "dateCreatedLocal": "2018-07-24T13:57:20Z",
                            "horizontalAccuracy": 5
                        ]
                    ]
                ]
            ]
        ]
        
        let userDomain: String = "testing.hubat.net"
        let dataDebitID: String = "5e614226-763f-4ccc-bb78-3b50980632de"
        let urlToConnect: String = "https://testing.hubat.net/api/v2.6/data-debit/\(dataDebitID)/values"
        let token: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaVkzSmxaR1Z1ZEdsaGJITWlMQ0p3Y205MmFXUmxja3RsZVNJNkluUmxjM1JwYm1jaWZRPT0iLCJyZXNvdXJjZSI6InRlc3RpbmcuaHViYXQubmV0IiwiYWNjZXNzU2NvcGUiOiJvd25lciIsImlzcyI6InRlc3RpbmcuaHViYXQubmV0IiwiZXhwIjoxNTA4NjY4MjMwLCJpYXQiOjE1MDg0MDkwMzAsImp0aSI6IjZmYTNiYTNmN2QyMzMwMzMwMmUxMTgwMDllNzBjMzZmNGZiMjk3ODQzNmU4MDI0NmJmNTdjNmRlYWE1MjgxZGZmNGQwNjFhY2U4MjY5YjRiOTI5N2Q5ZmMyYmJkZjk5NDE2NzJmMGQ5MGM1YzFhMTkyYjZlNjk0N2Y3OWIxYzZjM2E5MmNlMGZmYzIyYTExMmI1NDJlYWY3ZmNkNTEzYjUzMzU1YmU4NzZjMTc0NmZlN2JlNTE1NmNmMjkzNDA5MDcwMTk4OTliOWYxMjEzMTMyNjNjMzBjYjI3MmViZTgwMjI1MDg0YmFkOGNkNTgzMzZkOWQ4YzIzNDkzYWM1YzIifQ.cObRGNjdXfjfp9pd5SF2vS-gj5t7faEEdn5bVat1TvjnX60oQGdc55M80VuDaNXnTnLQOAL6x9YnWgDY1bnmRa0_4_W8553VmMbEWdQ6fDaeW9iLhkh-UYWpIlxexvdof8Vy7YwKTLseR0l7JhheWBQkugp7bAJ7ZTnAIDOfGDR02_i7cdASvJwbefIeSOahdx9DVPMUj1DRE2dq7cR2-eRqJyc09cITKtKu0fY8reHqRfc2151grGx7KxRNd2aBMnqJeNgscOZR13jshapmrDTo9SSpyo8Z6CKcoWj-_7NdHa-8ceJSZzL64JkRbvCX07HdpmAuSIHuAA0xuQIqlg"
        
        let expectationTest: XCTestExpectation = expectation(description: "Checking getting of data debits...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(dataDebitValue: DataDebitValuesObject, newToken: String?) {
            
            XCTAssertTrue(!(dataDebitValue.conditions?.isEmpty ?? true))
            expectationTest.fulfill()
        }
        
        func failed(error: DataPlugError, dataDebitID: String) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATDataDebitsService.getDataDebitValues(
        dataDebitID: dataDebitID,
        userToken: token,
        userDomain: userDomain,
        succesfulCallBack: completion,
        failCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
