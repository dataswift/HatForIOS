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

internal class HATFileServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchFiles() {
        
        let body: [Dictionary<String, Any>] = [[
            "fileId": "iphonerumpelphoto",
            "name": "rumpelPhoto",
            "source": "iPhone",
            "dateCreated": "2017-11-05T10:40:44.527Z",
            "lastUpdated": "2017-11-05T10:40:44.527Z",
            "tags": [
                "iphone",
                "viewer",
                "photo"
            ],
            "status": [
                "size": 4752033,
                "status": "Completed"
            ],
            "contentUrl": "https://hubat-net-hatservice-v3ztbxc9civz-storages3bucket-m0gs7co0oyi2.s3-eu-west-1.amazonaws.com/testing.hubat.net/iphonerumpelphoto?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180118T180720Z&X-Amz-SignedHeaders=host&X-Amz-Expires=299&X-Amz-Credential=AKIAJBUBR3WGX4MX6H6A%2F20180118%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=ac0eac4e41889443c9bec3cf9dfc119b65b1955479a9193f50f0812dd8bdd868",
            "contentPublic": false,
            "permissions": [
                [
                    "userId": "de35e18d-147f-4664-8de7-409abf881754",
                    "contentReadable": true
                ]
            ]
            ]]
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://testing.hubat.net/api/v2.6/files/search"
        
        let expectationTest: XCTestExpectation = expectation(description: "Searching files for photos...")
        
        MockingjayProtocol.addStub(matcher: http(.post, uri: urlToConnect), builder: json(body))
        
        func completion(profileImages: [FileUploadObject], newToken: String?) {
            
            XCTAssertTrue(!profileImages.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: HATError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFileService.searchFiles(userDomain: userDomain, token: "", successCallback: completion, errorCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testDeleteFile() {
        
        let body: [Dictionary<String, Any>] = []
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/files/file/1)"
        
        let expectationTest: XCTestExpectation = expectation(description: "Deleting files from photos...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(result: Bool, newToken: String?) {
            
            XCTAssertTrue(result)
            expectationTest.fulfill()
        }
        
        func failed(error: HATError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFileService.deleteFile(fileID: "1", token: "", userDomain: userDomain, successCallback: completion, errorCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testMakeFilePublic() {
        
        let body: [Dictionary<String, Any>] = []
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/files/allowAccessPublic/1"
        
        let expectationTest: XCTestExpectation = expectation(description: "Making file Public...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(result: Bool) {
            
            XCTAssertTrue(result)
            expectationTest.fulfill()
        }
        
        func failed(error: HATError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFileService.makeFilePublic(fileID: "1", token: "", userDomain: userDomain, successCallback: completion, errorCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testMakeFilePrivate() {
        
        let body: [Dictionary<String, Any>] = []
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/files/restrictAccessPublic/1"
        
        let expectationTest: XCTestExpectation = expectation(description: "Making file Private...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(result: Bool) {
            
            XCTAssertTrue(result)
            expectationTest.fulfill()
        }
        
        func failed(error: HATError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFileService.makeFilePrivate(fileID: "1", token: "", userDomain: userDomain, successCallback: completion, errorCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testMarkUploadedFileAsComplete() {
        
        let body: Dictionary<String, Any> = [
            "fileId": "iphonerumpelphoto",
            "name": "rumpelPhoto",
            "source": "iPhone",
            "dateCreated": "2017-11-05T10:40:44.527Z",
            "lastUpdated": "2017-11-05T10:40:44.527Z",
            "tags": [
                "iphone",
                "viewer",
                "photo"
            ],
            "status": [
                "size": 4752033,
                "status": "Completed"
            ],
            "contentUrl": "https://hubat-net-hatservice-v3ztbxc9civz-storages3bucket-m0gs7co0oyi2.s3-eu-west-1.amazonaws.com/testing.hubat.net/iphonerumpelphoto?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180118T180720Z&X-Amz-SignedHeaders=host&X-Amz-Expires=299&X-Amz-Credential=AKIAJBUBR3WGX4MX6H6A%2F20180118%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=ac0eac4e41889443c9bec3cf9dfc119b65b1955479a9193f50f0812dd8bdd868",
            "contentPublic": false,
            "permissions": [
                [
                    "userId": "de35e18d-147f-4664-8de7-409abf881754",
                    "contentReadable": true
                ]
            ]
            ]
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/files/file/1/complete"
        
        let expectationTest: XCTestExpectation = expectation(description: "Marking up file as completed for photos...")
        
        MockingjayProtocol.addStub(matcher: http(.put, uri: urlToConnect), builder: json(body))
        
        func completion(file: FileUploadObject, newToken: String?) {
            
            XCTAssertTrue(file.status.status == "Completed")
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFileService.completeUploadFileToHAT(fileID: "1", token: "", tags: [], userDomain: userDomain, completion: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testUploadFile() {
        
        let body: Dictionary<String, Any> = [
            "fileId": "iphonerumpelphoto",
            "name": "rumpelPhoto",
            "source": "iPhone",
            "dateCreated": "2017-11-05T10:40:44.527Z",
            "lastUpdated": "2017-11-05T10:40:44.527Z",
            "tags": [
                "iphone",
                "viewer",
                "photo"
            ],
            "status": [
                "size": 4752033,
                "status": "Completed"
            ],
            "contentUrl": "https://hubat-net-hatservice-v3ztbxc9civz-storages3bucket-m0gs7co0oyi2.s3-eu-west-1.amazonaws.com/testing.hubat.net/iphonerumpelphoto?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180118T180720Z&X-Amz-SignedHeaders=host&X-Amz-Expires=299&X-Amz-Credential=AKIAJBUBR3WGX4MX6H6A%2F20180118%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=ac0eac4e41889443c9bec3cf9dfc119b65b1955479a9193f50f0812dd8bdd868",
            "contentPublic": false,
            "permissions": [
                [
                    "userId": "de35e18d-147f-4664-8de7-409abf881754",
                    "contentReadable": true
                ]
            ]
        ]
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/files/upload"
        
        let expectationTest: XCTestExpectation = expectation(description: "Upload file to HAT...")
        
        MockingjayProtocol.addStub(matcher: http(.post, uri: urlToConnect), builder: json(body))
        
        func completion(file: FileUploadObject, newToken: String?) {
            
            XCTAssertTrue(file.status.status == "Completed")
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFileService.uploadFileToHAT(fileName: "test", token: "", userDomain: userDomain, tags: [], completion: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testUpdateParameters() {
        
        let body: Dictionary<String, Any> = [
            "fileId": "iphonerumpelphoto",
            "name": "rumpelPhoto",
            "source": "iPhone",
            "dateCreated": "2017-11-05T10:40:44.527Z",
            "lastUpdated": "2017-11-05T10:40:44.527Z",
            "tags": [
                "iphone",
                "viewer",
                "photo"
            ],
            "status": [
                "size": 4752033,
                "status": "Completed"
            ],
            "contentUrl": "https://hubat-net-hatservice-v3ztbxc9civz-storages3bucket-m0gs7co0oyi2.s3-eu-west-1.amazonaws.com/testing.hubat.net/iphonerumpelphoto?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180118T180720Z&X-Amz-SignedHeaders=host&X-Amz-Expires=299&X-Amz-Credential=AKIAJBUBR3WGX4MX6H6A%2F20180118%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=ac0eac4e41889443c9bec3cf9dfc119b65b1955479a9193f50f0812dd8bdd868",
            "contentPublic": false,
            "permissions": [
                [
                    "userId": "de35e18d-147f-4664-8de7-409abf881754",
                    "contentReadable": true
                ]
            ]
        ]
        let userDomain: String = "testing.hubat.net"
        let urlToConnect: String = "https://\(userDomain)/api/v2.6/files/file/1"
        
        let expectationTest: XCTestExpectation = expectation(description: "Updating parameters of a file from HAT...")
        
        MockingjayProtocol.addStub(matcher: http(.put, uri: urlToConnect), builder: json(body))
        
        func completion(file: FileUploadObject, newToken: String?) {
            
            XCTAssertTrue(file.status.status == "Completed")
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFileService.updateParametersOfFile(fileID: "1", fileName: "test", token: "", userDomain: userDomain, tags: [], completion: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error: Error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    @available(iOS 10.0, *)
    func testUploadToHATWrapper() {
        
        let body: Dictionary<String, Any> = [
            "fileId": "iphonerumpelphoto",
            "name": "rumpelPhoto",
            "source": "iPhone",
            "dateCreated": "2017-11-05T10:40:44.527Z",
            "lastUpdated": "2017-11-05T10:40:44.527Z",
            "tags": [
                "iphone",
                "viewer",
                "photo"
            ],
            "status": [
                "size": 4752033,
                "status": "Completed"
            ],
            "contentUrl": "https://hubat-net-hatservice-v3ztbxc9civz-storages3bucket-m0gs7co0oyi2.s3-eu-west-1.amazonaws.com/testing.hubat.net/iphonerumpelphoto?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180118T180720Z&X-Amz-SignedHeaders=host&X-Amz-Expires=299&X-Amz-Credential=AKIAJBUBR3WGX4MX6H6A%2F20180118%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=ac0eac4e41889443c9bec3cf9dfc119b65b1955479a9193f50f0812dd8bdd868",
            "contentPublic": false,
            "permissions": [
                [
                    "userId": "de35e18d-147f-4664-8de7-409abf881754",
                    "contentReadable": true
                ]
            ]
        ]
        let userDomain: String = "testing.hubat.net"
        
        let expectationTest: XCTestExpectation = expectation(description: "Updating parameters of a file from HAT...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(file: FileUploadObject, newToken: String?) {
            
            XCTAssertTrue(file.status.status == "Completed")
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(size: CGSize(width: 25, height: 25))
        let image: UIImage = renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.green.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            let rectangle: CGRect = CGRect(x: 0, y: 0, width: 25, height: 25)
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        HATFileService.uploadFileToHATWrapper(token: "", userDomain: userDomain, fileToUpload: image, tags: [], progressUpdater: nil, completion: completion, errorCallBack: failed)
        
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
