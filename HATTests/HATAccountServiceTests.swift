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
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

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

        }

        HATAccountService.triggerHatUpdate(userDomain: userDomain, completion: completion)

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
