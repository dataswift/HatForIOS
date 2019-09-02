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
import XCTest

internal class LoginServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLoginRequest() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let expectationTest: XCTestExpectation = expectation(description: "Verification...")
        let userDomain: String = "mariostsekis.hubofallthings.net"

        func success(usersDomain: String) {

            XCTAssertTrue(usersDomain == userDomain)
            expectationTest.fulfill()
        }

        func failed(result: String) {

            XCTAssertFalse(false, "Nothing returned")
            expectationTest.fulfill()
        }

        HATLoginService.formatAndVerifyDomain(userHATDomain: userDomain, verifiedDomains: [".hubofallthings.net"], successfulVerification: success, failedVerification: failed)

        waitForExpectations(timeout: 10) { error in

            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testAuthorize() {

        let body: String = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt/JmV8Y7tyEsYdUQJtf9\noyWu+xx91rflRWg4+eCbgbJY8uFkoagbu5/5AdHBou1o21fElufsJdUgNDS0fa/z\nQzHey7q/9c8+JZChg5EYJvFmg8UB8wLBHpQC/5Oqj9vxvvot2tjfFeh35YhQszoz\nygmA7DeR5BLBWfR/PLiDvMEENQsjhdpYFmGWtcN5RWpF0UqWjluz/wQRXCJcxhiJ\njbCNaLcid9ijA7oowdwv50SlxSd019SXs1pRkkX7P4izXpX8i6hICx64waJKnxZa\nc8wiQAhAJuAHuiqUU6HOnMDw1g9KTIOUeefT+PO3wb7M46LsBYtf7zTJ2HypJSX8\nMwIDAQAB\n-----END PUBLIC KEY-----\n"

        let userDomain: String = "mariostsekis.hubofallthings.net"
        let expectationTest: XCTestExpectation = expectation(description: "Authentication...")

        func string(_ body: String, status: Int = 200, headers: [String: String]? = nil) -> (_ request: URLRequest) -> Response {
            return { (request: URLRequest) in
                stringData(body, status: status, headers: headers)(request)
            }
        }

        func stringData(_ data: String, status: Int = 200, headers: [String: String]? = nil) -> (_ request: URLRequest) -> Response {
            return { (request: URLRequest) in
                var headers: [String: String] = headers ?? [String: String]()
                if headers["Content-Type"] == nil {
                    headers["Content-Type"] = "text/plain; charset=utf-8"
                }
                let data2: Data = data.data(using: .utf8)!
                return http(status, headers: headers, download: .content(data2))(request)
            }
        }

        if let url: String = HATAccountService.theUserHATDomainPublicKeyURL(userDomain) {

            MockingjayProtocol.addStub(matcher: http(.get, uri: url), builder: string(body) )

            func completion(userDomain: String?, result: String?) {

                if result != nil {

                    XCTAssert(true)
                } else {

                    XCTAssert(false)
                }
                expectationTest.fulfill()
            }

            func failed(error: AuthenicationError) {

                XCTFail("Failed authorizing user")
                expectationTest.fulfill()
            }

            let urlToConnect: String = "notables://notablesapphost?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhcHBsaWNhdGlvblZlcnNpb24iOiIxLjAuMCIsInN1YiI6IjEtZjF0UEtjWlFnZ3U2dWRsb2RuUXpGUkF4Sjh0RzBsS0lTdXBoRHp2OURIUklKczBBZ3NwdDVoQ2d5UWEwZVltRmFJV0FQa1N6Y1FMSmx4M3VmWFdVaEluQTJVRmhWcmNOQkpzPSIsImFwcGxpY2F0aW9uIjoibm90YWJsZXMiLCJpc3MiOiJ0ZXN0aW5nLmh1YmF0Lm5ldCIsImV4cCI6MTUyMjkzNjI1MywiaWF0IjoxNTIwMzQ0MjUzLCJqdGkiOiJhZDI3MGE2M2NjM2Y2ZmFhN2QwNjExY2Y2NTg5MjA5NzE2OTJiNzc2OTg4OWY3YzRiZGMyOTVjOWUwZTQ5ZWMzZWMwMDU5YTlmMmJiOTFjNTBmYzNiY2VjMjk2YTgyNDgzMzc1YzkxNjBlMzdjNmRlZTA2NmVhMDQxZDUzMTBiODVlNjliZWRiOGE3ZDA1MjA5OTk5N2Q0ZTZmYmQzYWIzZjk4YTUwOTYzNWU3MWE3MzEzMDQ3YWFhMjdkOTI4NTNjZjJmZjMxOTE4YTE0OWQ3Y2RiYThiNzQwYjc4NGRmNTg3NGZiZjAxZDQzZGQ5ZjI5MzJiMWIwZTJlMGIyOGYzIn0.mJf-I3v8X-7FwAaBSKdMNCMpXG5ONkP837y0gpVSjP1MqO4a3EaRrTnqhAWSxx1dq9oykVnolZ18cN4Zwa522i3yMsJ-9pZnvtuNG4Nhk2Su9XVlbwFxKyJsc-3geAvmVn_SA_JIwqmgKuP1w57veuznwhFwHC_tb78lD2nYyFbrB8qWs-Jma2mKIZpccGUPf_Gs0t4hFQNYSc7r-O8TXT_rCMcr1UV4AcRKsNYkIPXb-WgxeMLp-KhP9E_WOvi4YUEOI3u5o5_zDz0AL40UxlT3t8UkYJUa3uv5wVfus1TehBAYGNmaJsINc0rGrCW3oAZevIdyRDbXrHn_IQryew"

            HATLoginService.loginToHATAuthorization(applicationName: "notables", url: NSURL(string: urlToConnect)!, success: completion, failed: failed)

            waitForExpectations(timeout: 10) { error in

                if let error: Error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }

}
