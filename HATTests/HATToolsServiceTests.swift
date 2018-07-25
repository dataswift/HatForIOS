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

class HATToolsServiceTests: XCTestCase {
    
    let appsResponseJSON: [Dictionary<String, Any>] = [
        [
            "id": "data-feed-counter",
            "info": [
                "version": "1.0.0",
                "name": "Weekly Summary",
                "headline": "A summary of your week’s digital activities",
                "description": [
                    "text": "Weekly Summary shows your weekly online activities.\nIt allows you to to have an overview of your data accumulated in a week. The first weekly summary establish the start date of the tool and is a summary of your history of activities"
                ],
                "termsUrl": "terms",
                "dataPreview": [
                    [
                        "source": "she",
                        "date": [
                            "iso": "2018-07-25T07:32:55.460Z",
                            "unix": 1532503975
                        ],
                        "types": [
                            "note"
                        ],
                        "title": [
                            "text": "HAT Private Micro-server created",
                            "subtitle": "21 June 23:00 - 29 June 06:42 GMT",
                            "action": "insight"
                        ],
                        "content": [
                            "text": "Twitter:\n  Tweets sent: 1\n\nFacebook:\n  Posts composed: 13\n",
                            "nestedStructure": [
                                "twitter": [
                                    [
                                        "content": "Tweets sent",
                                        "badge": "1"
                                    ]
                                ]
                            ]
                        ]
                    ]
                ],
                "graphics": [
                    "banner": [
                        "normal": ""
                    ],
                    "logo": [
                        "normal": "https://github.com/Hub-of-all-Things/exchange-assets/blob/master/insights-activity-summary/logo.png?raw=true"
                    ],
                    "screenshots": [
                        [
                            "normal": "https://github.com/Hub-of-all-Things/exchange-assets/blob/master/insights-activity-summary/screenshot1.jpg?raw=true"
                        ]
                    ]
                ],
                "dataPreviewEndpoint": "she/insights/activity-records"
            ],
            "developer": [
                "id": "hatdex",
                "name": "HATDeX",
                "url": "https://hatdex.org",
                "country": "United Kingdom"
            ],
            "trigger": [
                "period": 0,
                "triggerType": "periodic"
            ],
            "dataBundle": [
                "name": "data-feed-counter",
                "bundle": [
                    "monzo/transactions": [
                        "endpoints": [
                            [
                                "endpoint": "monzo/transactions"
                            ]
                        ],
                        "orderBy": "created",
                        "ordering": "descending"
                    ]
                ]
            ],
            "status": [
                "available": true,
                "enabled": true,
                "lastExecution": "2018-07-23T14:46:50.429Z"
            ]
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
