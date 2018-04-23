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

internal class HATGoogleCalendarTests: XCTestCase {
    
    let feedBody: [Dictionary<String, Any>] = [
        [
            "endpoint": "calendar/google/events",
            "recordId": "8cf70c6f-cf76-48cd-8084-2896dcf9a795",
            "data": [
                "id": "_74pjigq661342ba38524ab9k70q48b9p74pjgb9h68r30c258d0jgha38c",
                "end": [
                    "dateTime": "2016-08-03T11:00:00+01:00"
                ],
                "etag": "\"2936510004024000\"",
                "kind": "calendar#event",
                "start": [
                    "dateTime": "2016-08-03T10:00:00+01:00"
                ],
                "status": "confirmed",
                "created": "2016-07-11T16:30:19.000Z",
                "creator": [
                    "email": "irene.cl.ng@googlemail.com",
                    "displayName": "Irene Ng"
                ],
                "iCalUID": "939CF0FA-CADE-484D-9938-12600ECA8ECC",
                "summary": "Chat with Irene Ng",
                "updated": "2016-07-11T16:36:42.012Z",
                "htmlLink": "https://www.google.com/calendar/event?eid=Xzc0cGppZ3E2NjEzNDJiYTM4NTI0YWI5azcwcTQ4YjlwNzRwamdiOWg2OHIzMGMyNThkMGpnaGEzOGMgdG41OGdzN2d2YTY5aTkxMGxndWtoY2FwZDBAZw",
                "location": "Marketsquare",
                "sequence": 0,
                "organizer": [
                    "self": true,
                    "email": "tn58gs7gva69i910lgukhcapd0@group.calendar.google.com",
                    "displayName": "HAT Events"
                ],
                "reminders": [
                    "useDefault": true
                ],
                "calendarId": "tn58gs7gva69i910lgukhcapd0@group.calendar.google.com",
                "description": "Irene Ng takes questions about the HAT ecosystem"
            ]
        ],
        [
            "endpoint": "calendar/google/events",
            "recordId": "d072f405-f15c-4d11-a5fb-d3c89c55ef64",
            "data": [
                "id": "o59d224su0ae2gjh0hq911c07s",
                "end": [
                    "date": "2016-06-10"
                ],
                "etag": "\"2930746065940000\"",
                "kind": "calendar#event",
                "start": [
                    "date": "2016-06-09"
                ],
                "status": "confirmed",
                "created": "2016-05-25T15:25:31.000Z",
                "creator": [
                    "email": "coster.adam@googlemail.com",
                    "displayName": "Adam Coster"
                ],
                "iCalUID": "o59d224su0ae2gjh0hq911c07s@google.com",
                "summary": "HAT Community Foundation members meeting",
                "updated": "2016-06-08T08:03:52.970Z",
                "htmlLink": "https://www.google.com/calendar/event?eid=bzU5ZDIyNHN1MGFlMmdqaDBocTkxMWMwN3MgdG41OGdzN2d2YTY5aTkxMGxndWtoY2FwZDBAZw",
                "sequence": 0,
                "organizer": [
                    "self": true,
                    "email": "tn58gs7gva69i910lgukhcapd0@group.calendar.google.com",
                    "displayName": "HAT Events"
                ],
                "reminders": [
                    "useDefault": true
                ],
                "calendarId": "tn58gs7gva69i910lgukhcapd0@group.calendar.google.com",
                "transparency": "transparent"
            ]
        ],
        [
            "endpoint": "calendar/google/events",
            "recordId": "2e7a07de-247e-4c4d-ad2f-0529f247e40a",
            "data": [
                "id": "tdoud1mka084ht00lknbe2vid4",
                "end": [
                    "dateTime": "2016-06-20T19:00:00+01:00"
                ],
                "etag": "\"2928349983258000\"",
                "kind": "calendar#event",
                "start": [
                    "dateTime": "2016-06-20T15:00:00+01:00"
                ],
                "status": "confirmed",
                "colorId": "8",
                "created": "2016-05-25T11:16:31.000Z",
                "creator": [
                    "email": "y.f.limwmg@gmail.com",
                    "displayName": "Yin Lim"
                ],
                "iCalUID": "tdoud1mka084ht00lknbe2vid4@google.com",
                "summary": "HALL launch meeting and BBQ ",
                "updated": "2016-05-25T11:16:31.629Z",
                "htmlLink": "https://www.google.com/calendar/event?eid=dGRvdWQxbWthMDg0aHQwMGxrbmJlMnZpZDQgdG41OGdzN2d2YTY5aTkxMGxndWtoY2FwZDBAZw",
                "location": "HAT Central",
                "sequence": 0,
                "organizer": [
                    "self": true,
                    "email": "tn58gs7gva69i910lgukhcapd0@group.calendar.google.com",
                    "displayName": "HAT Events"
                ],
                "reminders": [
                    "useDefault": true
                ],
                "calendarId": "tn58gs7gva69i910lgukhcapd0@group.calendar.google.com"
            ]
        ],
        [
            "endpoint": "calendar/google/events",
            "recordId": "cdf07afd-2fdf-415d-af85-a07f87d5b7f6",
            "data": [
                "id": "_8gsj8d9k6kq42ba2691kcb9k84qj6b9p8h0j6b9o60s44c9h6ssjcc9n6o",
                "end": [
                    "dateTime": "2016-07-26T11:00:00+01:00"
                ],
                "etag": "\"2936510173582000\"",
                "kind": "calendar#event",
                "start": [
                    "dateTime": "2016-07-26T10:00:00+01:00"
                ],
                "status": "confirmed",
                "created": "2016-07-11T16:31:33.000Z",
                "creator": [
                    "email": "irene.cl.ng@googlemail.com",
                    "displayName": "Irene Ng"
                ],
                "iCalUID": "D945454A-B2CF-4A53-9DA3-808B11796176",
                "summary": "Target release of beta HATs",
                "updated": "2016-07-11T16:38:06.791Z",
                "htmlLink": "https://www.google.com/calendar/event?eid=Xzhnc2o4ZDlrNmtxNDJiYTI2OTFrY2I5azg0cWo2YjlwOGgwajZiOW82MHM0NGM5aDZzc2pjYzluNm8gdG41OGdzN2d2YTY5aTkxMGxndWtoY2FwZDBAZw",
                "sequence": 0,
                "organizer": [
                    "self": true,
                    "email": "tn58gs7gva69i910lgukhcapd0@group.calendar.google.com",
                    "displayName": "HAT Events"
                ],
                "reminders": [
                    "useDefault": true
                ],
                "calendarId": "tn58gs7gva69i910lgukhcapd0@group.calendar.google.com",
                "description": "Beta is out today!"
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
    
    func testGetGoogleData() {
        
        let expectationTest = expectation(description: "Get google calendar data from hat...")
        
        func success(feed: [HATGoogleCalendarObject], newToken: String?) {
            
            XCTAssertTrue(!feed.isEmpty)
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        let userDomain = "testing.hubat.net"
        let userToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaWJXRnlhVzl6ZEhObGEybHpMbWgxWW05bVlXeHNkR2hwYm1kekxtNWxkQ0lzSW5CeWIzWnBaR1Z5UzJWNUlqb2liV0Z5YVc5emRITmxhMmx6SW4wPSIsInJlc291cmNlIjoibWFyaW9zdHNla2lzLmh1Ym9mYWxsdGhpbmdzLm5ldCIsImFjY2Vzc1Njb3BlIjoib3duZXIiLCJpc3MiOiJtYXJpb3N0c2VraXMuaHVib2ZhbGx0aGluZ3MubmV0IiwiZXhwIjoxNDg3MzIyNzk0LCJpYXQiOjE0ODcwNjM1OTQsImp0aSI6ImUxYWY1ODY3ZWRhNjFmM2MxMmE3YzE1OGEwNDhmMjM0YmFiMzI3ZDVhNzQ5NDIzYWIwNGU1OTkxZTUxZDE1MTM0MzE3MDQwZDFhMjBiNTI1ZDMxODFmNWJiNTI3ZmVkMWJhMWYzZWEwZTlmZTM0MjZmM2E5ZDMwNmFjMGY3NGFjMTM1MWQ1OTFhYmMxZTI4NmJmMGYyMjgzNzRkZWU2MDdhYWQ2MjU3OGJkNzJhZTI2OWI4NDY4NWJiYjY2OGMzMmQzODRkZjQwZjIxNDU4Y2IwMjFlMDc5ODc5MzFmNmVlNTMyNWMxNGViNGNiOGFmYTNlMWI0ZjgwNzQ5M2M3ZDYifQ.lz3Snzglz9WtGTIlp4qmJsCnpljrwafYRSg7QKa9CNQAfq_yB5XIOcfH8As8f_fneQW08-ats4Qk1F_yfeQKPIa2GnissQj0W2rl4pnRMiFcKE2vddMRsM_fwGEsr43foGNIjJM3KIBPaECxC_QZdGdqu_wnpSS2rRqbJPrcdPs5FOhAWaLdL6ej0vkhdVX97-VwGyW70AcwZ-yFP8mKLZygwixqPn1-ubCc2ahkS94cM40s4-fon0HNNC4SNOB-q4g_87caAjXRN6cchrJitltHZ3_4xe4p9wMCK-LGjF99xUYT4aUbsiJ4tOPKOcqQsZgbfBZGqUM4_4aHQQ3Pxg"
        let urlToConnect = "https://testing.hubat.net/api/v2.6/data/calendar/google/events"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(feedBody))
        
        HATGoogleCalendarService.getCalendarEvents(
            userToken: userToken,
            userDomain: userDomain,
            parameters: [:],
            successCallback: success,
            errorCallback: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGettingGoogleCalendarToken() {
        
        let body: Dictionary<String, Any> = ["accessToken": "token"]
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://\(userDomain)/users/application_token?name=Calendar&resource=calendar"
        
        let expectationTest = expectation(description: "Getting app token for google calendar...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(facebookToken: String, newUserToken: String?) {
            
            XCTAssertTrue(facebookToken == "token")
            expectationTest.fulfill()
        }
        
        func failed(error: JSONParsingError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        var plug = HATDataPlugObject()
        plug.plug.name = "Calendar"
        plug.plug.url = "calendar"
        
        HATFacebookService.getAppTokenForFacebook(plug: plug, token: "", userDomain: userDomain, successful: completion, failed: failed)
        
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
