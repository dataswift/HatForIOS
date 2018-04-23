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

internal class NotableServiceTests: XCTestCase {

    static let notesV2Response: [[String: Any]] = [
        [
            "endpoint": "rumpel/notablesv1",
            "recordId": "55ae1663-d4ea-494d-9fcb-b89c6b955171",
            "data": [
                "kind": "note",
                "shared": true,
                "currently_shared": true,
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
    
    func testGetNotes() {
        
        let expectationTest = expectation(description: "Get notes data from hat...")
        
        func success(notes: [HATNotesObject], newToken: String?) {
            
            XCTAssertTrue(notes[0].data.kind == "note")
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2.6/data/rumpel/notablesv1?orderBy=updated_time&ordering=descending"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(NotableServiceTests.notesV2Response))
        
        HATNotablesService.getNotes(
            userDomain: userDomain,
            userToken: userToken,
            success: success,
            failed: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testDeleteNotes() {
        
        let expectationTest = expectation(description: "Delete note data from hat...")
        let body = [""]
        
        func success(token: String) {
            
            XCTAssertTrue(token == "")
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2.6/data?records=123"
        
        MockingjayProtocol.addStub(matcher: http(.delete, uri: urlToConnect), builder: json(body))
        
        HATNotablesService.deleteNotes(noteIDs: ["123"], userToken: "", userDomain: userDomain, success: success, failed: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testUpdateNotes() {
        
        let expectationTest = expectation(description: "Update note data from hat...")
        let body = [
            [
                "endpoint": "rumpel/notablesv1",
                "recordId": "e9ad3c29-787d-468f-b81f-e388c1190a6e",
                "data": [
                    "kind": "note",
                    "shared": true,
                    "message": "test updated",
                    "photov1": [
                        "link": "",
                        "shared": false,
                        "source": "rumpel",
                        "caption": ""
                    ],
                    "authorv1": [
                        "name": "",
                        "phata": "testing.hubat.net",
                        "nickname": "",
                        "photo_url": ""
                    ],
                    "shared_on": [],
                    "created_time": "2018-01-23T12:00:19Z",
                    "updated_time": "2018-01-23T12:00:34Z",
                    "currently_shared": false
                ]
            ]
        ]
        func success(updatedNote: HATNotesObject, token: String?) {
            
            XCTAssertTrue(updatedNote.data.message == "test updated")
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2.6/data"
        var note = HATNotesObject()
        note.data.message = "test updated"
        MockingjayProtocol.addStub(matcher: http(.put, uri: urlToConnect), builder: json(body))
        
        HATNotablesService.updateNote(note: note, userToken: "", userDomain: userDomain, success: success, failed: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testPostNote() {
        
        let expectationTest = expectation(description: "Post note to hat...")
        let body = [
            [
                "endpoint": "rumpel/notablesv1",
                "recordId": "e9ad3c29-787d-468f-b81f-e388c1190a6e",
                "data": [
                    "kind": "note",
                    "shared": true,
                    "message": "test updated",
                    "photov1": [
                        "link": "",
                        "shared": false,
                        "source": "rumpel",
                        "caption": ""
                    ],
                    "authorv1": [
                        "name": "",
                        "phata": "testing.hubat.net",
                        "nickname": "",
                        "photo_url": ""
                    ],
                    "shared_on": [],
                    "created_time": "2018-01-23T12:00:19Z",
                    "updated_time": "2018-01-23T12:00:34Z",
                    "currently_shared": false
                ]
            ]
        ]
        func success(updatedNote: HATNotesObject, token: String?) {
            
            XCTAssertTrue(updatedNote.data.message == "test updated")
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://\(userDomain)/api/v2.6/data/rumpel/notablesv1"
        
        var note = HATNotesObject()
        note.data.message = "test updated"
        
        MockingjayProtocol.addStub(matcher: http(.post, uri: urlToConnect), builder: json(body))
        
        HATNotablesService.postNote(userDomain: userDomain, userToken: "", note: note, successCallBack: success, errorCallback: fail)
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testRemoveDuplicates() {

        let note1 = HATNotesObject()
        let note2 = note1

        var array = [note1, note2]

        array = HATNotablesService.removeDuplicatesFrom(array: array)

        XCTAssertTrue(array.count == 1)
    }
    
    func testSortNotables() {
        
        var note1 = HATNotesObject()
        note1.recordId = "432"
        note1.data.updated_time = "2018-01-22T12:00:34Z"
        var note2 = note1
        note2.data.updated_time = "2018-01-23T12:00:34Z"
        note2.recordId = "2432"
        
        let array = [note1, note2]
        
        let temp = HATNotablesService.sortNotables(notes: array)
        
        XCTAssertTrue(temp[0].recordId == "2432")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
