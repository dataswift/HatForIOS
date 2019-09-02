//
/**
 * Copyright (C) 2016-2019 Dataswift Ltd
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
}
