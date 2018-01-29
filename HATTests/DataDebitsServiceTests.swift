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
        
        let body: [Dictionary<String, Any>] = [
            [
                "dataDebitKey": "8127e4c8-19e2-4e4e-aafb-1145bb175325",
                "dateCreated": "2017-09-28T14:21:15+0000",
                "client": [
                    "userId": "8127e4c8-19e2-4e4e-aafb-1145bb175325",
                    "email": "location-test-offer",
                    "pass": "$2a$12$iJ2ZNq1.JBobqH4bsrn8b.wI6BJGFlvptkIdKrON5ALaB3enDEKvm",
                    "name": "Location test offer",
                    "role": "validate",
                    "roles": []
                ],
                "bundles": [
                    [
                        "dateCreated": "2017-09-28T14:21:15+0000",
                        "startDate": "2017-09-28T14:21:38+0000",
                        "endDate": "2017-09-29T14:21:38+0000",
                        "rolling": false,
                        "enabled": true,
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
                        ]
                    ]
                ]
            ]
        ]
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2/data-debit"
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaVkzSmxaR1Z1ZEdsaGJITWlMQ0p3Y205MmFXUmxja3RsZVNJNkluUmxjM1JwYm1jaWZRPT0iLCJyZXNvdXJjZSI6InRlc3RpbmcuaHViYXQubmV0IiwiYWNjZXNzU2NvcGUiOiJvd25lciIsImlzcyI6InRlc3RpbmcuaHViYXQubmV0IiwiZXhwIjoxNTA4NjY4MjMwLCJpYXQiOjE1MDg0MDkwMzAsImp0aSI6IjZmYTNiYTNmN2QyMzMwMzMwMmUxMTgwMDllNzBjMzZmNGZiMjk3ODQzNmU4MDI0NmJmNTdjNmRlYWE1MjgxZGZmNGQwNjFhY2U4MjY5YjRiOTI5N2Q5ZmMyYmJkZjk5NDE2NzJmMGQ5MGM1YzFhMTkyYjZlNjk0N2Y3OWIxYzZjM2E5MmNlMGZmYzIyYTExMmI1NDJlYWY3ZmNkNTEzYjUzMzU1YmU4NzZjMTc0NmZlN2JlNTE1NmNmMjkzNDA5MDcwMTk4OTliOWYxMjEzMTMyNjNjMzBjYjI3MmViZTgwMjI1MDg0YmFkOGNkNTgzMzZkOWQ4YzIzNDkzYWM1YzIifQ.cObRGNjdXfjfp9pd5SF2vS-gj5t7faEEdn5bVat1TvjnX60oQGdc55M80VuDaNXnTnLQOAL6x9YnWgDY1bnmRa0_4_W8553VmMbEWdQ6fDaeW9iLhkh-UYWpIlxexvdof8Vy7YwKTLseR0l7JhheWBQkugp7bAJ7ZTnAIDOfGDR02_i7cdASvJwbefIeSOahdx9DVPMUj1DRE2dq7cR2-eRqJyc09cITKtKu0fY8reHqRfc2151grGx7KxRNd2aBMnqJeNgscOZR13jshapmrDTo9SSpyo8Z6CKcoWj-_7NdHa-8ceJSZzL64JkRbvCX07HdpmAuSIHuAA0xuQIqlg"
        
        let expectationTest = expectation(description: "Checking getting of data debits...")
        
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
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
