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

import XCTest

class HATJSONHelperTests: XCTestCase {

    func testCreateFileUploadingJSONFrom() {
        
        let result: [String: Any] = HATJSONHelper.createFileUploadingJSONFrom(fileName: "testFile", tags: ["testTag"])
        XCTAssert(result["name"] as? String == "testFile")
        XCTAssert(result["source"] as? String == "rumpel")
        XCTAssert(result["tags"] as? [String] == ["testTag"])
    }
    
    func testCreateFileUploadingJSONFrom2() {
        
        var nationality: HATNationality = HATNationality()
        nationality.nationality = "Greek"
        nationality.language = "Greek"
        nationality.placeOfBirth = "Alexandroupolis"
        let result: [String: String] = HATJSONHelper.createFileUploadingJSONFrom(nationality: nationality)
        XCTAssert(result["nationality"] == "Greek")
        XCTAssert(result["language"] == "Greek")
        XCTAssert(result["placeOfBirth"] == "Alexandroupolis")
        XCTAssert(result["nationality"] == "Greek")
    }
    
}
