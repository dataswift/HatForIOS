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

private struct Bodies {
    
    static let profile: [[String: Any]] = [[
        "endpoint": "rumpel/profile",
        "recordId": "43e39bd4-958f-4e49-ad47-1e2e1bc04034",
        "data": [
            "about": [
                "body": "",
                "title": ""
            ],
            "photo": [
                "avatar": "https://testing.hubat.net/api/v2/files/content/rumpelhatgrey.png"
            ],
            "online": [
                "blog": "",
                "google": "",
                "twitter": "",
                "website": "",
                "youtube": "",
                "facebook": "",
                "linkedin": ""
            ],
            "shared": false,
            "address": [
                "city": "",
                "county": "",
                "country": ""
            ],
            "contact": [
                "mobile": "",
                "landline": "",
                "primaryEmail": "",
                "alternativeEmail": ""
            ],
            "personal": [
                "title": "Mr",
                "gender": "male",
                "ageGroup": "80",
                "lastName": "Buggidy",
                "nickName": "",
                "birthDate": "",
                "firstName": "Gus",
                "middleName": "M",
                "preferredName": ""
            ],
            "dateCreated": 32423,
            "emergencyContact": [
                "mobile": "",
                "lastName": "",
                "firstName": "",
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
        
        let expectationTest = expectation(description: "Get profile data from rumpel...")
        
        func success(profile: HATProfileObject, newToken: String?) {
            
            XCTAssertTrue(profile.data.personal.ageGroup == "80")
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
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
    
//    func testGetNationality() {
//        
//        let expectationTest = expectation(description: "Get nationality from hat...")
//        
//        func success(nationality: HATNationalityObject) {
//            
//            XCTAssertTrue(nationality.nationality == "80")
//            expectationTest.fulfill()
//        }
//        
//        func fail(error: HATTableError) {
//            
//            XCTFail()
//            expectationTest.fulfill()
//        }
//        
//        let userDomain = "testing.hubat.net"
//        let urlToConnect = "https://testing.hubat.net/api/v2/data/rumpel/nationality"
//        
//        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(Bodies.profile))
//        
//        HATProfileService.getNationalityFromHAT(userDomain: userDomain, userToken: "", successCallback: success, failCallback: fail)
//        
//        waitForExpectations(timeout: 10) { error in
//            
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
