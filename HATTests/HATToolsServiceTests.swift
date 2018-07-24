//
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

private class HATToolsServiceTests: XCTestCase {
    
    let appsResponseJSON: [Dictionary<String, Any>] =
        [
            [
                "id": "id",
                "name": "data-feed-direct-mapper",
                "description": "",
                "headline": "",
                "trigger": [
                    "triggerType": "individual"
                ],
                "available": false,
                "enabled": true,
                "dataBundle": [
                    "name": "data-feed-direct-mapper",
                    "bundle": [
                        "fitbit/activity/day/summary": [
                            "endpoints": [
                                [
                                    "endpoint": "fitbit/activity/day/summary"
                                ]
                            ],
                            "orderBy": "dateCreated",
                            "ordering": "descending"
                        ]
                    ]
                ],
                "lastExecution": "2018-06-01T08:12:09.875Z"
            ]
        ]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetAvailableTools() {
        
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/she/function"
        
        let expectationTest: XCTestExpectation = expectation(description: "Getting tools from HAT...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(appsResponseJSON))
        
        func completion(appsReceived: [HATToolsObject], newUserToken: String?) {
            
            XCTAssertTrue(!appsReceived.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATToolsService.getAvailableTools(userDomain: userDomain, userToken: "", completion: completion, failCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
