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

// MARK: Enum

public enum HATJSONHelper {
    
    // MARK: - Create JSON for file uploading
    
    /**
     Creates the `JSON` structure needed to upload a file
     
     - parameter fileName: The file name of the file
     - parameter tags: The tags attached to the photo
     - parameter source: The source of the file usually the application uploadding the file
     
     - returns: A `Dictionary <String, Any>` with the name, source and tags
     */
    static func createFileUploadingJSONFrom(fileName: String, tags: [String], source: String = "rumpel") -> [String: Any] {
        
        // the final JSON file to be returned
        return [
            
            "name": fileName,
            "source": source,
            "tags": tags
        ]
    }
}
