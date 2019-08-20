/**
 * Copyright (C) 2019 HAT Data Exchange Ltd
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

internal class LocationServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetLocationData() {
        
        let body: [[String: Any]] = [
            [
                "endpoint": "rumpel/locations/ios",
                "recordId": "ad0c3ef8-e024-4053-a875-76228b9aa0ea",
                "data": [
                    "speed": -1,
                    "course": -1,
                    "altitude": 0,
                    "latitude": 51.481863995071002,
                    "longitude": -0.20492033352121,
                    "dateCreated": 1510764709,
                    "dateCreatedLocal": "2017-11-15T16:51:49Z",
                    "verticalAccuracy": -1,
                    "horizontalAccuracy": 5
                ]
            ],
            [
                "endpoint": "rumpel/locations/ios",
                "recordId": "3e5c6cf2-53e8-422e-9620-49325d630902",
                "data": [
                    "speed": -1,
                    "course": 98.385727538879109,
                    "altitude": 36.26617431640625,
                    "latitude": 51.531658460580942,
                    "longitude": -0.2384621294897431,
                    "dateCreated": 1510906206,
                    "dateCreatedLocal": "2017-11-17T08:10:06Z",
                    "verticalAccuracy": 10,
                    "horizontalAccuracy": 65
                ]
            ]
        ]
        let userDomain: String = "mariostsekis.hubofallthings.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/data/rumpel/locations/ios"
        let expectationTest: XCTestExpectation = expectation(description: "Getting location data...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(locations: [HATLocations], newToken: String?) {
            
            XCTAssert(!locations.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail("Failed fetching location data")
            expectationTest.fulfill()
        }
        
        HATLocationService.getLocations(userDomain: userDomain, userToken: "", fromDate: Date(), toDate: Date(), successCallback: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testSyncLocationData() {
        
        let body: [[String: Any]] = [
            [
                "endpoint": "rumpel/locations/ios",
                "recordId": "ad0c3ef8-e024-4053-a875-76228b9aa0ea",
                "data": [
                    "speed": -1,
                    "course": -1,
                    "altitude": 0,
                    "latitude": 51.481863995071002,
                    "longitude": -0.20492033352121,
                    "dateCreated": 1510764709,
                    "dateCreatedLocal": "2017-11-15T16:51:49Z",
                    "verticalAccuracy": -1,
                    "horizontalAccuracy": 5
                ]
            ],
            [
                "endpoint": "rumpel/locations/ios",
                "recordId": "3e5c6cf2-53e8-422e-9620-49325d630902",
                "data": [
                    "speed": -1,
                    "course": 98.385727538879109,
                    "altitude": 36.26617431640625,
                    "latitude": 51.531658460580942,
                    "longitude": -0.2384621294897431,
                    "dateCreated": 1510906206,
                    "dateCreatedLocal": "2017-11-17T08:10:06Z",
                    "verticalAccuracy": 10,
                    "horizontalAccuracy": 65
                ]
            ]
        ]
        let userDomain: String = "mariostsekis.hubofallthings.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/data/rumpel/locations/ios"
        let expectationTest: XCTestExpectation = expectation(description: "Syncing location data...")
        
        stub(everything, http(201))
        
        func completion(isSuccess: Bool, newToken: String?) {
            
            XCTAssert(isSuccess)
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail("Failed syncing locations")
            expectationTest.fulfill()
        }
        
        var locations: [HATLocationsData] = []
        var location: HATLocationsData = HATLocationsData()
        location.latitude = 1
        location.longitude = 1
        location.horizontalAccuracy = 5
        locations.append(location)
        locations.append(location)
        
        HATLocationService.syncLocationsToHAT(userDomain: userDomain, userToken: "", locations: locations, completion: completion)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testFailbackSyncLocationData() {
        
        let body: [[String: Any]] = [
            [
                "endpoint": "rumpel/locations/ios",
                "recordId": "ad0c3ef8-e024-4053-a875-76228b9aa0ea",
                "data": [
                    "speed": -1,
                    "course": -1,
                    "altitude": 0,
                    "latitude": 51.481863995071002,
                    "longitude": -0.20492033352121,
                    "dateCreated": 1510764709,
                    "dateCreatedLocal": "2017-11-15T16:51:49Z",
                    "verticalAccuracy": -1,
                    "horizontalAccuracy": 5
                ]
            ],
            [
                "endpoint": "rumpel/locations/ios",
                "recordId": "3e5c6cf2-53e8-422e-9620-49325d630902",
                "data": [
                    "speed": -1,
                    "course": 98.385727538879109,
                    "altitude": 36.26617431640625,
                    "latitude": 51.531658460580942,
                    "longitude": -0.2384621294897431,
                    "dateCreated": 1510906206,
                    "dateCreatedLocal": "2017-11-17T08:10:06Z",
                    "verticalAccuracy": 10,
                    "horizontalAccuracy": 65
                ]
            ]
        ]
        let userDomain: String = "mariostsekis.hubofallthings.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/data/rumpel/locations/ios"
        let expectationTest: XCTestExpectation = expectation(description: "Syncing duplicate failback location data...")
        
        MockingjayProtocol.addStub(matcher: http(.post, uri: urlToConnect), builder: json(body))
        
        func completion(isSuccess: Bool, newToken: String?) {
            
            XCTAssert(isSuccess)
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail("Failed failback syncing locations")
            expectationTest.fulfill()
        }
        
        var locations: [HATLocationsData] = []
        var location: HATLocationsData = HATLocationsData()
        location.latitude = 1
        location.longitude = 1
        location.horizontalAccuracy = 5
        locations.append(location)
        locations.append(location)
        
        HATLocationService.failbackDuplicateSyncing(dbLocations: locations, userDomain: userDomain, userToken: "", completion: completion)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetLocationCombinator() {
        
        let body: [[String: Any]] = [
            [
                "endpoint": "rumpel/locations/ios",
                "recordId": "1b3b3330-b12c-495a-b804-4852b381cb32",
                "data": [
                    "altitude": 33.103290557861328,
                    "latitude": 51.549901707663658,
                    "longitude": -0.14753057959405264,
                    "dateCreated": 1516696210,
                    "dateCreatedLocal": "2018-01-23T08:30:10Z",
                    "verticalAccuracy": 10,
                    "horizontalAccuracy": 65
                ]
            ],
            [
                "endpoint": "rumpel/locations/ios",
                "recordId": "38d0259b-eb8e-4c2b-8715-51e2614eade5",
                "data": [
                    "altitude": 47.009178161621094,
                    "latitude": 51.55482878195064,
                    "longitude": -0.14848267670549045,
                    "dateCreated": 1516696149,
                    "dateCreatedLocal": "2018-01-23T08:29:09Z",
                    "verticalAccuracy": 14.692635536193848,
                    "horizontalAccuracy": 1008.8839228110418
                ]
            ]
        ]
        
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/combinator/locationsfilter"
        let expectationTest: XCTestExpectation = expectation(description: "Gettin location combinator...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(locations: [HATLocations], newToken: String?) {
            
            XCTAssert(!locations.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: HATError) {
            
            XCTFail("Failed fetching location combinator")
            expectationTest.fulfill()
        }
        
        HATLocationService.getLocationCombinator(userDomain: userDomain, userToken: "", successCallback: completion, failCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
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
