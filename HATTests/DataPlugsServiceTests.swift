/**
 * Copyright (C) 2017 HAT Data Exchange Ltd
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

internal class DataPlugsServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetAvailableDataPlugs() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let body: [Dictionary<String, Any>] = [[
            "plug": [
                "uuid": "2086929c-feca-41ea-ada0-45eaf4f00ca4",
                "providerId": "1b0903e4-10b0-4744-b5b9-4867bef19f20",
                "created": 1234,
                "name": "Photos",
                "description": "Import your best moments from Dropbox into your HAT",
                "url": "https://photos-plug.hubofallthings.com/dataplug",
                "illustrationUrl": "https://rumpel.hubofallthings.com/assets/icons/photos-plug.png",
                "passwordHash": "$2a$08$UfiQWbSvX5Pai6zvrhgTpe6AE/iSBgynn2XAigObqxYGJ0ctDhq/i",
                "approved": true
            ],
            "provider": [
                "id": "1b0903e4-10b0-4744-b5b9-4867bef19f20",
                "email": "",
                "emailConfirmed": true,
                "password": "",
                "name": "HATDeX admin",
                "dateCreated": 1234
            ]
        ]]
        let expectationTest = expectation(description: "Checking for available data plugs...")

        let urlToConnect = "https://dex.hubofallthings.com/api/dataplugs"

        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))

        func success(objects: [HATDataPlugObject], userToken: String?) {

            XCTAssertTrue(objects.count == 1)
            expectationTest.fulfill()
        }

        func fail(error: DataPlugError) {

        }

        HATDataPlugsService.getAvailableDataPlugs(succesfulCallBack: success, failCallBack: fail)

        waitForExpectations(timeout: 10) { error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testCheckIfOfferIsClaimed() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let body: Dictionary<String, String> = [
            "confirmed": "false",
            "dataDebitId": "1234567"
        ]
        let expectationTest = expectation(description: "Checking if offer is claimed...")

        let offerID = "123"
        let urlToConnect = "https://dex.hubofallthings.com/api/offer/" + offerID + "/userClaim"
        let appToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaWJXRnlhVzl6ZEhObGEybHpMbWgxWW05bVlXeHNkR2hwYm1kekxtNWxkQ0lzSW5CeWIzWnBaR1Z5UzJWNUlqb2liV0Z5YVc5emRITmxhMmx6SW4wPSIsInJlc291cmNlIjoibWFyaW9zdHNla2lzLmh1Ym9mYWxsdGhpbmdzLm5ldCIsImFjY2Vzc1Njb3BlIjoib3duZXIiLCJpc3MiOiJtYXJpb3N0c2VraXMuaHVib2ZhbGx0aGluZ3MubmV0IiwiZXhwIjoxNDg3MzIyNzk0LCJpYXQiOjE0ODcwNjM1OTQsImp0aSI6ImUxYWY1ODY3ZWRhNjFmM2MxMmE3YzE1OGEwNDhmMjM0YmFiMzI3ZDVhNzQ5NDIzYWIwNGU1OTkxZTUxZDE1MTM0MzE3MDQwZDFhMjBiNTI1ZDMxODFmNWJiNTI3ZmVkMWJhMWYzZWEwZTlmZTM0MjZmM2E5ZDMwNmFjMGY3NGFjMTM1MWQ1OTFhYmMxZTI4NmJmMGYyMjgzNzRkZWU2MDdhYWQ2MjU3OGJkNzJhZTI2OWI4NDY4NWJiYjY2OGMzMmQzODRkZjQwZjIxNDU4Y2IwMjFlMDc5ODc5MzFmNmVlNTMyNWMxNGViNGNiOGFmYTNlMWI0ZjgwNzQ5M2M3ZDYifQ.lz3Snzglz9WtGTIlp4qmJsCnpljrwafYRSg7QKa9CNQAfq_yB5XIOcfH8As8f_fneQW08-ats4Qk1F_yfeQKPIa2GnissQj0W2rl4pnRMiFcKE2vddMRsM_fwGEsr43foGNIjJM3KIBPaECxC_QZdGdqu_wnpSS2rRqbJPrcdPs5FOhAWaLdL6ej0vkhdVX97-VwGyW70AcwZ-yFP8mKLZygwixqPn1-ubCc2ahkS94cM40s4-fon0HNNC4SNOB-q4g_87caAjXRN6cchrJitltHZ3_4xe4p9wMCK-LGjF99xUYT4aUbsiJ4tOPKOcqQsZgbfBZGqUM4_4aHQQ3Pxg"

        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))

        func success(result: String) {

            XCTAssertTrue(result == "1234567")
            expectationTest.fulfill()
        }

        func fail(error: DataPlugError) {

        }

        HATDataPlugsService.checkIfOfferIsClaimed(offerID: offerID, appToken: appToken, succesfulCallBack: success, failCallBack: fail)

        waitForExpectations(timeout: 10) { error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testClaimOfferWithOfferID() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let body: Dictionary<String, String> = [
            "confirmed": "false",
            "dataDebitId": "1234567"
        ]
        let expectationTest = expectation(description: "Claiming offer...")

        let offerID = "123"
        let urlToConnect = "https://dex.hubofallthings.com/api/offer/" + offerID + "/claim"
        let appToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaWJXRnlhVzl6ZEhObGEybHpMbWgxWW05bVlXeHNkR2hwYm1kekxtNWxkQ0lzSW5CeWIzWnBaR1Z5UzJWNUlqb2liV0Z5YVc5emRITmxhMmx6SW4wPSIsInJlc291cmNlIjoibWFyaW9zdHNla2lzLmh1Ym9mYWxsdGhpbmdzLm5ldCIsImFjY2Vzc1Njb3BlIjoib3duZXIiLCJpc3MiOiJtYXJpb3N0c2VraXMuaHVib2ZhbGx0aGluZ3MubmV0IiwiZXhwIjoxNDg3MzIyNzk0LCJpYXQiOjE0ODcwNjM1OTQsImp0aSI6ImUxYWY1ODY3ZWRhNjFmM2MxMmE3YzE1OGEwNDhmMjM0YmFiMzI3ZDVhNzQ5NDIzYWIwNGU1OTkxZTUxZDE1MTM0MzE3MDQwZDFhMjBiNTI1ZDMxODFmNWJiNTI3ZmVkMWJhMWYzZWEwZTlmZTM0MjZmM2E5ZDMwNmFjMGY3NGFjMTM1MWQ1OTFhYmMxZTI4NmJmMGYyMjgzNzRkZWU2MDdhYWQ2MjU3OGJkNzJhZTI2OWI4NDY4NWJiYjY2OGMzMmQzODRkZjQwZjIxNDU4Y2IwMjFlMDc5ODc5MzFmNmVlNTMyNWMxNGViNGNiOGFmYTNlMWI0ZjgwNzQ5M2M3ZDYifQ.lz3Snzglz9WtGTIlp4qmJsCnpljrwafYRSg7QKa9CNQAfq_yB5XIOcfH8As8f_fneQW08-ats4Qk1F_yfeQKPIa2GnissQj0W2rl4pnRMiFcKE2vddMRsM_fwGEsr43foGNIjJM3KIBPaECxC_QZdGdqu_wnpSS2rRqbJPrcdPs5FOhAWaLdL6ej0vkhdVX97-VwGyW70AcwZ-yFP8mKLZygwixqPn1-ubCc2ahkS94cM40s4-fon0HNNC4SNOB-q4g_87caAjXRN6cchrJitltHZ3_4xe4p9wMCK-LGjF99xUYT4aUbsiJ4tOPKOcqQsZgbfBZGqUM4_4aHQQ3Pxg"

        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))

        func success(result: String) {

            XCTAssertTrue(result == "1234567")
            expectationTest.fulfill()
        }

        func fail(error: DataPlugError) {

        }

        HATDataPlugsService.claimOfferWithOfferID(offerID, appToken: appToken, succesfulCallBack: success, failCallBack: fail)

        waitForExpectations(timeout: 10) { error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testApproveDataDebit() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let body: Dictionary<String, String> = [
            "confirmed": "false",
            "dataDebitId": "1234567"
        ]
        let expectationTest = expectation(description: "Approving data debit...")

        let dataDebitID = "123"
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://mariostsekis.hubofallthings.net/dataDebit/123/enable"
        let appToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaWJXRnlhVzl6ZEhObGEybHpMbWgxWW05bVlXeHNkR2hwYm1kekxtNWxkQ0lzSW5CeWIzWnBaR1Z5UzJWNUlqb2liV0Z5YVc5emRITmxhMmx6SW4wPSIsInJlc291cmNlIjoibWFyaW9zdHNla2lzLmh1Ym9mYWxsdGhpbmdzLm5ldCIsImFjY2Vzc1Njb3BlIjoib3duZXIiLCJpc3MiOiJtYXJpb3N0c2VraXMuaHVib2ZhbGx0aGluZ3MubmV0IiwiZXhwIjoxNDg3MzIyNzk0LCJpYXQiOjE0ODcwNjM1OTQsImp0aSI6ImUxYWY1ODY3ZWRhNjFmM2MxMmE3YzE1OGEwNDhmMjM0YmFiMzI3ZDVhNzQ5NDIzYWIwNGU1OTkxZTUxZDE1MTM0MzE3MDQwZDFhMjBiNTI1ZDMxODFmNWJiNTI3ZmVkMWJhMWYzZWEwZTlmZTM0MjZmM2E5ZDMwNmFjMGY3NGFjMTM1MWQ1OTFhYmMxZTI4NmJmMGYyMjgzNzRkZWU2MDdhYWQ2MjU3OGJkNzJhZTI2OWI4NDY4NWJiYjY2OGMzMmQzODRkZjQwZjIxNDU4Y2IwMjFlMDc5ODc5MzFmNmVlNTMyNWMxNGViNGNiOGFmYTNlMWI0ZjgwNzQ5M2M3ZDYifQ.lz3Snzglz9WtGTIlp4qmJsCnpljrwafYRSg7QKa9CNQAfq_yB5XIOcfH8As8f_fneQW08-ats4Qk1F_yfeQKPIa2GnissQj0W2rl4pnRMiFcKE2vddMRsM_fwGEsr43foGNIjJM3KIBPaECxC_QZdGdqu_wnpSS2rRqbJPrcdPs5FOhAWaLdL6ej0vkhdVX97-VwGyW70AcwZ-yFP8mKLZygwixqPn1-ubCc2ahkS94cM40s4-fon0HNNC4SNOB-q4g_87caAjXRN6cchrJitltHZ3_4xe4p9wMCK-LGjF99xUYT4aUbsiJ4tOPKOcqQsZgbfBZGqUM4_4aHQQ3Pxg"

        MockingjayProtocol.addStub(matcher: everything, builder: json(body))

        func success(result: String) {

            XCTAssertTrue(result == "enabled")
            expectationTest.fulfill()
        }

        func fail(error: DataPlugError) {

        }

        HATDataPlugsService.approveDataDebit(dataDebitID, userToken: appToken, userDomain: userDomain, succesfulCallBack: success, failCallBack: fail)

        waitForExpectations(timeout: 10) { error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testCheckDataDebit() {

        let body: Dictionary<String, Any> =
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
        let expectationTest = expectation(description: "Checking data debit...")

        let dataDebitID = "123"
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://\(userDomain)/api/v2/data-debit/\(dataDebitID)"
        let appToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaWJXRnlhVzl6ZEhObGEybHpMbWgxWW05bVlXeHNkR2hwYm1kekxtNWxkQ0lzSW5CeWIzWnBaR1Z5UzJWNUlqb2liV0Z5YVc5emRITmxhMmx6SW4wPSIsInJlc291cmNlIjoibWFyaW9zdHNla2lzLmh1Ym9mYWxsdGhpbmdzLm5ldCIsImFjY2Vzc1Njb3BlIjoib3duZXIiLCJpc3MiOiJtYXJpb3N0c2VraXMuaHVib2ZhbGx0aGluZ3MubmV0IiwiZXhwIjoxNDg3MzIyNzk0LCJpYXQiOjE0ODcwNjM1OTQsImp0aSI6ImUxYWY1ODY3ZWRhNjFmM2MxMmE3YzE1OGEwNDhmMjM0YmFiMzI3ZDVhNzQ5NDIzYWIwNGU1OTkxZTUxZDE1MTM0MzE3MDQwZDFhMjBiNTI1ZDMxODFmNWJiNTI3ZmVkMWJhMWYzZWEwZTlmZTM0MjZmM2E5ZDMwNmFjMGY3NGFjMTM1MWQ1OTFhYmMxZTI4NmJmMGYyMjgzNzRkZWU2MDdhYWQ2MjU3OGJkNzJhZTI2OWI4NDY4NWJiYjY2OGMzMmQzODRkZjQwZjIxNDU4Y2IwMjFlMDc5ODc5MzFmNmVlNTMyNWMxNGViNGNiOGFmYTNlMWI0ZjgwNzQ5M2M3ZDYifQ.lz3Snzglz9WtGTIlp4qmJsCnpljrwafYRSg7QKa9CNQAfq_yB5XIOcfH8As8f_fneQW08-ats4Qk1F_yfeQKPIa2GnissQj0W2rl4pnRMiFcKE2vddMRsM_fwGEsr43foGNIjJM3KIBPaECxC_QZdGdqu_wnpSS2rRqbJPrcdPs5FOhAWaLdL6ej0vkhdVX97-VwGyW70AcwZ-yFP8mKLZygwixqPn1-ubCc2ahkS94cM40s4-fon0HNNC4SNOB-q4g_87caAjXRN6cchrJitltHZ3_4xe4p9wMCK-LGjF99xUYT4aUbsiJ4tOPKOcqQsZgbfBZGqUM4_4aHQQ3Pxg"

        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))

        func success(result: Bool) {

            XCTAssertTrue(result)
            expectationTest.fulfill()
        }

        func fail(error: DataPlugError) {

        }

        HATDataPlugsService.checkDataDebit(dataDebitID, userToken: appToken, userDomain: userDomain, succesfulCallBack: success, failCallBack: fail)

        waitForExpectations(timeout: 10) { error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testCheckSocialPlugAvailability() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let body: Dictionary<String, String> = [
            "canPost": "true"
        ]
        let expectationTest = expectation(description: "Checking social plug availability...")

        let urlToConnect = "https://facebook.hubat.net/api/status"

        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))

        func success(result: String) {

            XCTAssertTrue(result == "true")
            expectationTest.fulfill()
        }

        func fail(error: DataPlugError) {

        }

        let test = HATDataPlugsService.checkSocialPlugAvailability(succesfulCallBack: success, failCallBack: fail)
        test("")

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
