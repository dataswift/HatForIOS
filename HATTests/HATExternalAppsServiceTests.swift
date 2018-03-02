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

internal class HATExternalAppsServiceTests: XCTestCase {
    
    let appsResponseJSON: [Dictionary<String, Any>] = [
        [
            "application": [
                "id": "notables",
                "kind": [
                    "url": "https://itunes.apple.com/gb/app/notables/id1338778866?mt=8",
                    "iosUrl": "https://itunes.apple.com/gb/app/notables/id1338778866?mt=8",
                    "kind": "App"
                ],
                "info": [
                    "version": "1.0.0",
                    "published": true,
                    "name": "Notables",
                    "headline": "All your words",
                    "description": [
                        "text": "\n Anything you write online is your data – searches, social media posts, comments and notes.\n\n Start your notes here on Notables, where they will be stored completely privately in your HAT.\n\n Use Notables to draft and share social media posts. You can set how long they stay on Twitter or Facebook – a day, a week or a month. You can always set them back to private later: it will disappear from your social media but you won’t lose it because it’s saved in your HAT.\n\n Add images or pin locations as reminders of where you were or what you saw.\n          ",
                        "markdown": "\n Anything you write online is your data – searches, social media posts, comments and notes.\n\n Start your notes here on Notables, where they will be stored completely privately in your HAT.\n\n Use Notables to draft and share social media posts. You can set how long they stay on Twitter or Facebook – a day, a week or a month. You can always set them back to private later: it will disappear from your social media but you won’t lose it because it’s saved in your HAT.\n\n Add images or pin locations as reminders of where you were or what you saw.\n          ",
                        "html": "\n <p>Anything you write online is your data – searches, social media posts, comments and notes.</p>\n\n <p>Start your notes here on Notables, where they will be stored completely privately in your HAT.</p>\n\n <p>Use Notables to draft and share social media posts. You can set how long they stay on Twitter or Facebook – a day, a week or a month. You can always set them back to private later: it will disappear from your social media but you won’t lose it because it’s saved in your HAT.</p>\n\n <p>Add images or pin locations as reminders of where you were or what you saw.</p>\n          "
                    ],
                    "dataPreview": [
                        [
                            "source": "notables",
                            "date": [
                                "iso": "2018-03-02T08:01:13.965Z",
                                "unix": 1519977673
                            ],
                            "types": [
                                "note"
                            ],
                            "title": [
                                "text": "leila.hubat.net",
                                "action": "private"
                            ],
                            "content": [
                                "text": "Notes are live!"
                            ]
                        ],
                        [
                            "source": "notables",
                            "date": [
                                "iso": "2018-03-02T08:01:13.991Z",
                                "unix": 1519977673
                            ],
                            "types": [
                                "note"
                            ],
                            "title": [
                                "text": "leila.hubat.net",
                                "action": "private"
                            ],
                            "content": [
                                "text": "And I love 'em!"
                            ]
                        ]
                    ],
                    "graphics": [
                        "banner": [
                            "normal": ""
                        ],
                        "logo": [
                            "normal": "https://s3-eu-west-1.amazonaws.com/hubofallthings-com-dexservi-dexpublicassetsbucket-kex8hb7fsdge/notablesapp/0x0ss.png"
                        ],
                        "screenshots": [
                            [
                                "normal": "https://s3-eu-west-1.amazonaws.com/hubofallthings-com-dexservi-dexpublicassetsbucket-kex8hb7fsdge/notablesapp/0x0ss.jpg",
                                "large": "https://s3-eu-west-1.amazonaws.com/hubofallthings-com-dexservi-dexpublicassetsbucket-kex8hb7fsdge/notablesapp/0x0ss-5.jpg"
                            ],
                            [
                                "normal": "https://s3-eu-west-1.amazonaws.com/hubofallthings-com-dexservi-dexpublicassetsbucket-kex8hb7fsdge/notablesapp/0x0ss-2.jpg",
                                "large": "https://s3-eu-west-1.amazonaws.com/hubofallthings-com-dexservi-dexpublicassetsbucket-kex8hb7fsdge/notablesapp/0x0ss-6.jpg"
                            ],
                            [
                                "normal": "https://s3-eu-west-1.amazonaws.com/hubofallthings-com-dexservi-dexpublicassetsbucket-kex8hb7fsdge/notablesapp/0x0ss-3.jpg",
                                "large": "https://s3-eu-west-1.amazonaws.com/hubofallthings-com-dexservi-dexpublicassetsbucket-kex8hb7fsdge/notablesapp/0x0ss-7.jpg"
                            ]
                        ]
                    ]
                ],
                "permissions": [
                    "rolesGranted": [
                        [
                            "role": "namespacewrite",
                            "detail": "rumpel"
                        ],
                        [
                            "role": "namespaceread",
                            "detail": "rumpel"
                        ],
                        [
                            "role": "datadebit",
                            "detail": "app-notables"
                        ]
                    ],
                    "dataRequired": [
                        "bundle": [
                            "name": "app-notables-v100",
                            "bundle": [
                                "profile": [
                                    "endpoints": [
                                        [
                                            "endpoint": "rumpel/profile",
                                            "filters": [
                                                [
                                                    "field": "shared",
                                                    "operator": [
                                                        "value": true,
                                                        "operator": "contains"
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ],
                                    "orderBy": "dateCreated",
                                    "ordering": "descending",
                                    "limit": 1
                                ],
                                "notables": [
                                    "endpoints": [
                                        [
                                            "endpoint": "rumpel/notablesv1",
                                            "mapping": [
                                                "name": "personal.preferredName",
                                                "nick": "personal.nickName",
                                                "photo_url": "photo.avatar"
                                            ],
                                            "filters": [
                                                [
                                                    "field": "shared",
                                                    "operator": [
                                                        "value": true,
                                                        "operator": "contains"
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ],
                                    "orderBy": "updated_time",
                                    "ordering": "descending",
                                    "limit": 1
                                ]
                            ]
                        ],
                        "startDate": "2018-03-02T08:01:14+0000",
                        "endDate": "2019-03-02T08:01:14+0000",
                        "rolling": true
                    ]
                ],
                "setup": [
                    "iosUrl": "notablesapp://notablesapphost",
                    "kind": "External"
                ],
                "status": [
                    "compatibility": "1.0.0",
                    "recentDataCheckEndpoint": "/rumpel/notablesv1",
                    "kind": "Internal"
                ]
            ],
            "setup": true,
            "active": true,
            "needsUpdating": false
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
    
    func testGetApps() {
        
        let userDomain: String = "testing.hubat.net"
        let urlToConnect = "https://\(userDomain)/api/v2/applications"
        
        let expectationTest = expectation(description: "Getting apps from HAT...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(appsResponseJSON))
        
        func completion(appsReceived: [HATApplicationObject], newUserToken: String?) {
            
            XCTAssertTrue(!appsReceived.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATExternalAppsService.getExternalApps(userToken: "", userDomain: "testing.hubat.net", completion: completion, failCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
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
