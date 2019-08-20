//
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

import XCTest

class HATTokenHelperTests: XCTestCase {

    func testCheckTokenScopeNilToken() {
        
        let token: String? = nil
        
        let result: String? = HATTokenHelper.checkTokenScope(token: token, applicationName: "hatapp")
        
        XCTAssert(result == nil)
    }
    
    func testCheckTokenScopeValidToken() {
        
        let token: String? = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhcHBsaWNhdGlvblZlcnNpb24iOiIxLjAuMSIsInN1YiI6IjEtb1YwNWpsNWxTQ2JjZ3pJVTBlNUlxXC9nU3FPN0dzK2xmcVFlOTYybUpMZzJTK0lQWE1sOWVpaDRZa29JZmFKV3VTUm1SQm9MZHJ0bkkxRExmaENYZnMxSkVESHpQNk9qOXhaRT0iLCJhcHBsaWNhdGlvbiI6InNoYXBlc3RhZ2luZyIsImlzcyI6ImJyYWF2b3MuaHViYXQubmV0IiwiZXhwIjoxNTM4MTM0MDY3LCJpYXQiOjE1MzU1NDIwNjcsImp0aSI6ImU1OTc5M2UyNmFkNTA0ODdlMTk2ODI0N2U5ZWI2MDVmYzljNWRlZDhiMjIwMGMxNzlhZWI4YTVhODU5MTk4Yjc5MDEwNTQ4YWUxMTJkMTU1MjVlOTFhMmMzNWI2MmM0YzlmODlhNWE2YWQyMDZhNjUwM2RlYWVlNTIyYzc0NjNmY2ViNDI3YjU3MDYwMzQyNjQ3M2FkMWU0Yjc4MDE2MThhNjViMjU0NDEyMTU3MGQxNTIzMDhjZWFjNDFlMDM1MDg1Y2QyNjk1ZjQ4Yjc3MTg2NzU1OWIxZjYxNmY4MGI4ZWEyMTgyM2Q5MWVjNThkNzlhOThlOTQxNzVmYTk4YjYifQ.OvR3JkGSSHpmx-CHVJe8bulODmC4-ijanfmfEh-O0SRG59f6WK7wymQOZcrS1anMBugO3lzroI3ONyspmBVC--lPdD21WugzaEzNnsuX0MF9JNzDSuOFrGiykPFg2pZzRak4FjU-wYamkSsixS0wxFCpiW8IZVDAAf7Z2cW5FslRknaA-MCdyVPwP5Oi8yAUQ4lZj6Lp_sUq6cKLMBmru29cRCuhhanrcQCB2y2tXFTSCNsmfWtIvgEhR67ajvNK9Q8eXKmn-pTYpkk3nM3E7DsgHgmo1CFWTNkzSSqsh328ln6lACsyeKshUMGyOcLFYmwOi7Er84TOZalwL78cHA"
        
        let result: String? = HATTokenHelper.checkTokenScope(token: token, applicationName: "shapestaging")
        
        XCTAssert(result == token)
    }
    
    func testCheckTokenScopeInvalidToken() {
        
        let token: String? = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhcHBsaWNhdGlvblZlcnNpb24iOiIxLjAuMSIsInN1YiI6IjEtb1YwNWpsNWxTQ2JjZ3pJVTBlNUlxXC9nU3FPN0dzK2xmcVFlOTYybUpMZzJTK0lQWE1sOWVpaDRZa29JZmFKV3VTUm1SQm9MZHJ0bkkxRExmaENYZnMxSkVESHpQNk9qOXhaRT0iLCJhcHBsaWNhdGlvbiI6InNoYXBlc3RhZ2luZyIsImlzcyI6ImJyYWF2b3MuaHViYXQubmV0IiwiZXhwIjoxNTyMTU3MGQxNTIzMDhjZWFjNDFlMDM1MDg1Y2QyNjk1ZjQ4Yjc3MTg2NzU1OWIxZjYxNmY4MGI4ZWEyMTgyM2Q5MWVjNThkNzlhOThlOTQxNzVmYTk4YjYifQ.OvR3JkGSSHpmx-CHVJe8bulODmC4-ijanfmfEh-O0SRG59f6WK7wymQOZcrS1anMBugO3lzroI3ONyspmBVC--lPdD21WugzaEzNnsuX0MF9JNzDSuOFrGiykPFg2pZzRak4FjU-wYamkSsixS0wxFCpiW8IZVDAAf7Z2cW5FslRknaA-MCdyVPwP5Oi8yAUQ4lZj6Lp_sUq6cKLMBmru29cRCuhhanrcQCB2y2tXFTSCNsmfWtIvgEhR67ajvNK9Q8eXKmn-pTYpkk3nM3E7DsgHgmo1CFWTNkzSSqsh328ln6lACsyeKshUMGyOcLFYmwOi7Er84TOZalwL78cHA"
        
        let result: String? = HATTokenHelper.checkTokenScope(token: token, applicationName: "shapestaging")
        
        XCTAssert(result == nil)
    }

}
