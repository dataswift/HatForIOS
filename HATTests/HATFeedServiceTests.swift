//
//  HATFeedServiceTests.swift
//  HATTests
//
//  Created by Marios-Andreas Tsekis on 30/10/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import Alamofire
import Mockingjay
import SwiftyJSON
import XCTest

private struct Bodies {
    
    static let feedBody: [Dictionary<String, Any>] = [
        [
            "endpoint": "she/feed",
            "recordId": "2a7a4bac-864a-4b5e-9494-2c9a412a9fcf",
            "data": [
                "date": 1509312799,
                "title": [
                    "text": "You walked 3789 steps",
                    "action": "steps"
                ],
                "source": "fitbit",
                "content": nil,
                "location": nil
            ]
        ],
        [
            "endpoint": "she/feed",
            "recordId": "dfef929c-4fab-4855-85b1-9554d105a857",
            "data": [
                "date": 1509265200,
                "title": [
                    "text": "You posted this photo",
                    "action": nil
                ],
                "source": "facebook",
                "content": [
                    "text": nil,
                    "media": [
                        [
                            "url": "https://camo.githubusercontent.com/f92f247a903901becb770b14354654061fdaaa4b/687474703a2f2f696d672e796f75747562652e636f6d2f76692f79317478596a6f535151632f302e6a7067"
                        ]
                    ]
                ]
            ]
        ],
        [
            "endpoint": "she/feed",
            "recordId": "832f8fce-778b-47d7-b87b-585e0e6e29ad",
            "data": [
                "date": 1509264200,
                "title": [
                    "text": "You retweeted",
                    "action": nil
                ],
                "source": "twitter",
                "content": [
                    "text": "Son: Dad can we go to a haunted house this year?\nMe: What's wrong with the one we live in?\nSon: What?!?\nMe: Goodnight son."
                ]
            ]
        ],
        [
            "endpoint": "she/feed",
            "recordId": "348fff80-d9b4-4301-8957-bb40c83ff4e5",
            "data": [
                "date": 1509255200,
                "title": [
                    "text": "You posted this photo",
                    "action": nil
                ],
                "source": "instagram",
                "content": [
                    "text": "Commuting to my new desk #worklifebalance",
                    "media": [
                        [
                            "url": "https://media.wired.com/photos/59327d844dc9b45ccec5e7ca/master/pass/bikedesk.jpg"
                        ]
                    ]
                ]
            ]
        ],
        [
            "endpoint": "she/feed",
            "recordId": "bfbba54a-dacf-4304-8369-a102197c5ab1",
            "data": [
                "date": 1509245200,
                "title": [
                    "text": "You got yourself a HAT",
                    "action": nil
                ],
                "source": "hat",
                "content": [
                    "text": "Together we can change the Internet."
                ]
            ]
        ]
    ]
}

internal class HATFeedServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetFeed() {
        
        let expectationTest = expectation(description: "Get feed data from hat...")
        
        func success(feed: [HATFeedObject], newToken: String?) {
            
            XCTAssertTrue(feed[0].source == "fitbit")
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
        }
        
        let userDomain = "testing.hubat.net"
        let userToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaWJXRnlhVzl6ZEhObGEybHpMbWgxWW05bVlXeHNkR2hwYm1kekxtNWxkQ0lzSW5CeWIzWnBaR1Z5UzJWNUlqb2liV0Z5YVc5emRITmxhMmx6SW4wPSIsInJlc291cmNlIjoibWFyaW9zdHNla2lzLmh1Ym9mYWxsdGhpbmdzLm5ldCIsImFjY2Vzc1Njb3BlIjoib3duZXIiLCJpc3MiOiJtYXJpb3N0c2VraXMuaHVib2ZhbGx0aGluZ3MubmV0IiwiZXhwIjoxNDg3MzIyNzk0LCJpYXQiOjE0ODcwNjM1OTQsImp0aSI6ImUxYWY1ODY3ZWRhNjFmM2MxMmE3YzE1OGEwNDhmMjM0YmFiMzI3ZDVhNzQ5NDIzYWIwNGU1OTkxZTUxZDE1MTM0MzE3MDQwZDFhMjBiNTI1ZDMxODFmNWJiNTI3ZmVkMWJhMWYzZWEwZTlmZTM0MjZmM2E5ZDMwNmFjMGY3NGFjMTM1MWQ1OTFhYmMxZTI4NmJmMGYyMjgzNzRkZWU2MDdhYWQ2MjU3OGJkNzJhZTI2OWI4NDY4NWJiYjY2OGMzMmQzODRkZjQwZjIxNDU4Y2IwMjFlMDc5ODc5MzFmNmVlNTMyNWMxNGViNGNiOGFmYTNlMWI0ZjgwNzQ5M2M3ZDYifQ.lz3Snzglz9WtGTIlp4qmJsCnpljrwafYRSg7QKa9CNQAfq_yB5XIOcfH8As8f_fneQW08-ats4Qk1F_yfeQKPIa2GnissQj0W2rl4pnRMiFcKE2vddMRsM_fwGEsr43foGNIjJM3KIBPaECxC_QZdGdqu_wnpSS2rRqbJPrcdPs5FOhAWaLdL6ej0vkhdVX97-VwGyW70AcwZ-yFP8mKLZygwixqPn1-ubCc2ahkS94cM40s4-fon0HNNC4SNOB-q4g_87caAjXRN6cchrJitltHZ3_4xe4p9wMCK-LGjF99xUYT4aUbsiJ4tOPKOcqQsZgbfBZGqUM4_4aHQQ3Pxg"
        let urlToConnect = "https://testing.hubat.net/api/v2/data/she/feed"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(Bodies.feedBody))
        
        HATFeedService.getFeed(
            userDomain: userDomain,
            userToken: userToken,
            successCallback: success,
            failed: fail)
        
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