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
import SwiftyJSON
import XCTest

internal class NotableServiceTests: XCTestCase {

    static let notesV2Response = [
        [
            "endpoint": "rumpel/notablesv1",
            "recordId": "55ae1663-d4ea-494d-9fcb-b89c6b955171",
            "data": [
                "kind": "note",
                "shared": true,
                "message": "faceboooook",
                "authorv1": [
                    "phata": "testing.hubat.net",
                    "photo_url": ""
                ],
                "shared_on": [
                    "facebook",
                    "phata"
                ],
                "created_time": "2017-12-15T14:44:35.875Z",
                "public_until": "2017-12-16T14:44:55.121Z",
                "updated_time": "2017-12-15T14:44:57.563Z"
            ]
        ]
    ]
    
    private let userToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaVkzSmxaR1Z1ZEdsaGJITWlMQ0p3Y205MmFXUmxja3RsZVNJNkluUmxjM1JwYm1jaWZRPT0iLCJyZXNvdXJjZSI6InRlc3RpbmcuaHViYXQubmV0IiwiYWNjZXNzU2NvcGUiOiJvd25lciIsImlzcyI6InRlc3RpbmcuaHViYXQubmV0IiwiZXhwIjoxNTA3NjYxODMzLCJpYXQiOjE1MDc0MDI2MzMsImp0aSI6Ijc1ZmMxMzFkODg3OWNkY2MyMDQyZTZhOTkyMTBiOGU5YzQzYTI2Mjk0OTI4NzI5YWExOWFlODNhZWJjOWNhMjZjZWQzZDRhOTg3Y2I1YWE3YmM2MWFkODkxYTgyMGQzOTJiYTA0ZTE3ZWVkNzViMTg0NjExYWFkZDM1NjI0NDIzMDY1OTgyZWNiZTNlMGE1NDQxYjBkYjU3N2QyNDVlOGQ0NWI5NzhlNjFjM2MwMmEzMTMwYWU1NjI5NWJiMjIxNWJjNGM5OTQ0YjFlMTQzYzMwMTA5OTk2MzM1YTUwOTE4MmYzYzdmY2UxNWE1MTk5ODM5YjE5YWQyZWZlYjdlMDIifQ.kMpP8TYpmudTf41sYBVRz6dz5OboIkkBlyZvfYf8fgTE1BK8zv1X36lqQnagQsHvECcsUqxOsDGrnxpaL1BlO6mLZreRdVy8xojfCL_EVKxvvwEOmjQsQ5dgxeF8Q4-y9JoIQbsgAnf3ux8-F0i4dFR5wOeuBy_Q0oouV3Bmxeupf8r_nO7m_YeustaCtNpura9nTvs7AM-uL9BZUXZPBwi4LEnZi67zt6pFeZC8zTIinBimYB3BjFJuH4Mwlfrn-0S_K-Q0cbsQueCT7B3-qp2a3tgCke5EsJh8b1RXMa68p4gEYOQM_8ZLZc9M5GzQQs4vFKjXrD9CWkbXYVySvQ"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetNotesV2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectationTest = expectation(description: "Get notes v2 data from hat...")
        
        func success(notes: [HATNotesV2Object], newToken: String?) {
            
            XCTAssertTrue(notes[0].kind == "note")
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2/data/rumpel/notablesv1?orderBy=updated_time&ordering=descending"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(NotableServiceTests.notesV2Response))
        
        HATNotablesService.getNotesV2(
            userDomain: userDomain,
            token: userToken,
            success: success)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testSorting() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let note1 = HATNotesData()
        var note2 = HATNotesData()

        note2.lastUpdated = note2.lastUpdated.addingTimeInterval(100)

        var array = [note1, note2]

        array = HATNotablesService.sortNotables(notes: array)

        XCTAssertTrue(array[0] == note2)
    }

    func testRemoveDuplicates() {

        let note1 = HATNotesData()
        let note2 = note1

        var array = [note1, note2]

        array = HATNotablesService.removeDuplicatesFrom(array: array)

        XCTAssertTrue(array.count == 1)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
