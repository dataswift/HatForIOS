//
//  HATProfileServiceTests.swift
//  HATTests
//
//  Created by Marios-Andreas Tsekis on 2/11/17.
//  Copyright © 2017 HATDeX. All rights reserved.
//

import Alamofire
import Mockingjay
import SwiftyJSON
import XCTest

private struct Bodies {
    
    static let profile = [
        [
            "endpoint": "rumpelstaging/profile",
            "recordId": "f53a6b46-871c-4f84-bd46-8cf0ad0176c3",
            "data": [
                "age": [
                    "group": "",
                    "private": true
                ],
                "blog": [
                    "link": "",
                    "private": true
                ],
                "nick": [
                    "name": "",
                    "private": true
                ],
                "about": [
                    "body": "",
                    "title": "",
                    "private": true
                ],
                "birth": [
                    "date": "",
                    "private": true
                ],
                "gender": [
                    "type": "",
                    "private": true
                ],
                "google": [
                    "link": "",
                    "private": true
                ],
                "mobile": [
                    "no": "",
                    "private": true
                ],
                "private": false,
                "twitter": [
                    "link": "",
                    "private": true
                ],
                "website": [
                    "link": "",
                    "private": true
                ],
                "youtube": [
                    "link": "",
                    "private": true
                ],
                "facebook": [
                    "link": "",
                    "private": true
                ],
                "linkedin": [
                    "link": "",
                    "private": true
                ],
                "personal": [
                    "title": "Mr",
                    "private": false,
                    "last_name": "Guy",
                    "first_name": "F1",
                    "middle_name": "",
                    "preferred_name": ""
                ],
                "home_phone": [
                    "no": "",
                    "private": true
                ],
                "dateCreated": 1508413511855,
                "primary_email": [
                    "value": "",
                    "private": true
                ],
                "address_global": [
                    "city": "",
                    "county": "",
                    "country": "",
                    "private": true
                ],
                "address_details": [
                    "no": "",
                    "street": "",
                    "private": true,
                    "postcode": ""
                ],
                "fb_profile_photo": [
                    "private": true
                ],
                "alternative_email": [
                    "value": "",
                    "private": true
                ],
                "emergency_contact": [
                    "mobile": "",
                    "private": true,
                    "last_name": "",
                    "first_name": "",
                    "relationship": ""
                ]
            ]
        ]
    ]
}

private let userToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaVkzSmxaR1Z1ZEdsaGJITWlMQ0p3Y205MmFXUmxja3RsZVNJNkluUmxjM1JwYm1jaWZRPT0iLCJyZXNvdXJjZSI6InRlc3RpbmcuaHViYXQubmV0IiwiYWNjZXNzU2NvcGUiOiJvd25lciIsImlzcyI6InRlc3RpbmcuaHViYXQubmV0IiwiZXhwIjoxNTA3NjYxODMzLCJpYXQiOjE1MDc0MDI2MzMsImp0aSI6Ijc1ZmMxMzFkODg3OWNkY2MyMDQyZTZhOTkyMTBiOGU5YzQzYTI2Mjk0OTI4NzI5YWExOWFlODNhZWJjOWNhMjZjZWQzZDRhOTg3Y2I1YWE3YmM2MWFkODkxYTgyMGQzOTJiYTA0ZTE3ZWVkNzViMTg0NjExYWFkZDM1NjI0NDIzMDY1OTgyZWNiZTNlMGE1NDQxYjBkYjU3N2QyNDVlOGQ0NWI5NzhlNjFjM2MwMmEzMTMwYWU1NjI5NWJiMjIxNWJjNGM5OTQ0YjFlMTQzYzMwMTA5OTk2MzM1YTUwOTE4MmYzYzdmY2UxNWE1MTk5ODM5YjE5YWQyZWZlYjdlMDIifQ.kMpP8TYpmudTf41sYBVRz6dz5OboIkkBlyZvfYf8fgTE1BK8zv1X36lqQnagQsHvECcsUqxOsDGrnxpaL1BlO6mLZreRdVy8xojfCL_EVKxvvwEOmjQsQ5dgxeF8Q4-y9JoIQbsgAnf3ux8-F0i4dFR5wOeuBy_Q0oouV3Bmxeupf8r_nO7m_YeustaCtNpura9nTvs7AM-uL9BZUXZPBwi4LEnZi67zt6pFeZC8zTIinBimYB3BjFJuH4Mwlfrn-0S_K-Q0cbsQueCT7B3-qp2a3tgCke5EsJh8b1RXMa68p4gEYOQM_8ZLZc9M5GzQQs4vFKjXrD9CWkbXYVySvQ"

internal class HATProfileServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetProfile() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectationTest = expectation(description: "Get profile data from rumpel...")
        
        func success(profile: HATProfileObjectV2) {
            
            XCTAssertTrue(profile.data.age.`private` == true)
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2/data/rumpel/profile?orderBy=dateCreated&ordering=descending&take=1"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(Bodies.profile))
        
        HATProfileService.getProfile(userDomain: userDomain,
                                     userToken: userToken,
                                     successCallback: success,
                                     failCallback: fail)
        
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
