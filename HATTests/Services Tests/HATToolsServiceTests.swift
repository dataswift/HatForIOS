//
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
import Mockingjay
import SwiftyJSON
import XCTest

internal class HATToolsServiceTests: XCTestCase {
    
    let appsResponseJSON: [Dictionary<String, Any>] = [
        [
            "id": "sentiment-tracker",
            "info": [
                "version": "1.0.0",
                "versionReleaseDate": "2018-01-01T12:00:00.000Z",
                "name": "Sentiment Tracker",
                "headline": "Sentiment in your words",
                "description": [
                    "text": "Sentiment Tracker analyses your texts on Facebook, Twitter and Notables to work out how negative or positive your postings are."
                ],
                "termsUrl": "https://hatdex.org/terms-of-service-hat-owner-agreement",
                "supportContact": "contact@hatdex.org",
                "graphics": [
                    "banner": [
                        "normal": ""
                    ],
                    "logo": [
                        "normal": "https://github.com/Hub-of-all-Things/exchange-assets/blob/master/Sentiments/logo.png?raw=true"
                    ],
                    "screenshots": [
                        [
                            "normal": "https://github.com/Hub-of-all-Things/exchange-assets/blob/master/Sentiments/Screenshot1.jpg?raw=true"
                        ],
                        [
                            "normal": "https://github.com/Hub-of-all-Things/exchange-assets/blob/master/Sentiments/Screenshot2.jpg?raw=true"
                        ]
                    ]
                ],
                "dataPreviewEndpoint": "/she/feed/she/sentiments"
            ],
            "developer": [
                "id": "hatdex",
                "name": "Dataswift Ltd",
                "url": "https://hatdex.org",
                "country": "United Kingdom"
            ],
            "trigger": [
                "triggerType": "individual"
            ],
            "dataBundle": [
                "name": "data-feed-counter",
                "bundle": [
                    "facebook/feed": [
                        "endpoints": [
                            [
                                "endpoint": "facebook/feed",
                                "mapping": [
                                    "message": "message",
                                    "timestamp": "created_time"
                                ]
                            ]
                        ],
                        "orderBy": "created_time",
                        "ordering": "descending",
                        "limit": 20
                    ],
                    "twitter/tweets": [
                        "endpoints": [
                            [
                                "endpoint": "twitter/tweets",
                                "mapping": [
                                    "message": "text",
                                    "timestamp": "lastUpdated"
                                ]
                            ]
                        ],
                        "orderBy": "lastUpdated",
                        "ordering": "descending",
                        "limit": 20
                    ],
                    "notables/feed": [
                        "endpoints": [
                            [
                                "endpoint": "rumpel/notablesv1",
                                "mapping": [
                                    "message": "message",
                                    "timestamp": "created_time"
                                ]
                            ]
                        ],
                        "orderBy": "created_time",
                        "ordering": "descending",
                        "limit": 20
                    ],
                    "she/insights/emotions": [
                        "endpoints": [
                            [
                                "endpoint": "she/insights/emotions",
                                "mapping": [
                                    "message": "text",
                                    "timestamp": "timestamp"
                                ]
                            ]
                        ],
                        "orderBy": "timestamp",
                        "ordering": "descending",
                        "limit": 20
                    ]
                ]
            ],
            "status": [
                "available": true,
                "enabled": true,
                "lastExecution": "2018-09-14T15:08:53.405Z"
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
        
        func completion(appsReceived: [HATTools], newUserToken: String?) {
            
            XCTAssertTrue(!appsReceived.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail("Failed fetching available tools")
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
