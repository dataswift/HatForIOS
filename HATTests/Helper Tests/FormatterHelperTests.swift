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

internal class FormatterHelperTests: XCTestCase {

    func testFormattingStringToDate1() {

        let stringDate: String = "2017-02-14T18:07:33.000Z"

        let result: Date? = HATFormatterHelper.formatStringToDate(string: stringDate)

        var calendar: Calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let day: Int = calendar.component(.day, from: result!)
        let month: Int = calendar.component(.month, from: result!)
        let year: Int = calendar.component(.year, from: result!)

        let hour: Int = calendar.component(.hour, from: result!)
        let minutes: Int = calendar.component(.minute, from: result!)
        let seconds: Int = calendar.component(.second, from: result!)
        let mseconds: Int = calendar.component(.nanosecond, from: result!)
        
        XCTAssertTrue(day == 14)
        XCTAssertTrue(month == 02)
        XCTAssertTrue(year == 2017)
        XCTAssertTrue(hour == 18)
        XCTAssertTrue(minutes == 07)
        XCTAssertTrue(seconds == 33)
        XCTAssertTrue(mseconds == 000)
    }
    
    func testFormattingStringToDate2() {
        
        let stringDate: String = "2017-02-14T18:07:33-00:00"
        
        let result: Date? = HATFormatterHelper.formatStringToDate(string: stringDate)
        
        var calendar: Calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let day: Int = calendar.component(.day, from: result!)
        let month: Int = calendar.component(.month, from: result!)
        let year: Int = calendar.component(.year, from: result!)
        
        let hour: Int = calendar.component(.hour, from: result!)
        let minutes: Int = calendar.component(.minute, from: result!)
        let seconds: Int = calendar.component(.second, from: result!)
        let mseconds: Int = calendar.component(.nanosecond, from: result!)
        
        XCTAssertTrue(day == 14)
        XCTAssertTrue(month == 02)
        XCTAssertTrue(year == 2017)
        XCTAssertTrue(hour == 18)
        XCTAssertTrue(minutes == 07)
        XCTAssertTrue(seconds == 33)
        XCTAssertTrue(mseconds == 000)
    }
    
    func testFormattingStringToDate3() {
        
        let stringDate: String = "2017-02-14"
        
        let result: Date? = HATFormatterHelper.formatStringToDate(string: stringDate)
        
        var calendar: Calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let day: Int = calendar.component(.day, from: result!)
        let month: Int = calendar.component(.month, from: result!)
        let year: Int = calendar.component(.year, from: result!)
        
        XCTAssertTrue(day == 14)
        XCTAssertTrue(month == 02)
        XCTAssertTrue(year == 2017)
    }
    
    func testFormattingStringToDate4() {
        
        let stringDate: String = "2017-02-14T18:07:33.00Z"
        
        let result: Date? = HATFormatterHelper.formatStringToDate(string: stringDate)
        
        var calendar: Calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let day: Int = calendar.component(.day, from: result!)
        let month: Int = calendar.component(.month, from: result!)
        let year: Int = calendar.component(.year, from: result!)
        
        let hour: Int = calendar.component(.hour, from: result!)
        let minutes: Int = calendar.component(.minute, from: result!)
        let seconds: Int = calendar.component(.second, from: result!)
        let mseconds: Int = calendar.component(.nanosecond, from: result!)
        
        XCTAssertTrue(day == 14)
        XCTAssertTrue(month == 02)
        XCTAssertTrue(year == 2017)
        XCTAssertTrue(hour == 18)
        XCTAssertTrue(minutes == 07)
        XCTAssertTrue(seconds == 33)
        XCTAssertTrue(mseconds == 000)
    }
    
    func testFormattingStringToDate5() {
        
        let stringDate: String = "2017-02-14T18:07:33.000"
        
        let result: Date? = HATFormatterHelper.formatStringToDate(string: stringDate)
        
        var calendar: Calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let day: Int = calendar.component(.day, from: result!)
        let month: Int = calendar.component(.month, from: result!)
        let year: Int = calendar.component(.year, from: result!)
        
        let hour: Int = calendar.component(.hour, from: result!)
        let minutes: Int = calendar.component(.minute, from: result!)
        let seconds: Int = calendar.component(.second, from: result!)
        let mseconds: Int = calendar.component(.nanosecond, from: result!)
        
        XCTAssertTrue(day == 14)
        XCTAssertTrue(month == 02)
        XCTAssertTrue(year == 2017)
        XCTAssertTrue(hour == 18)
        XCTAssertTrue(minutes == 07)
        XCTAssertTrue(seconds == 33)
        XCTAssertTrue(mseconds == 000)
    }
    
    func testFormattingStringToDate6() {
        
        let stringDate: String = "Fri Dec 14 18:07:33 Z 2018"
        
        let result: Date? = HATFormatterHelper.formatStringToDate(string: stringDate)
        
        var calendar: Calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let day: Int = calendar.component(.day, from: result!)
        let month: Int = calendar.component(.month, from: result!)
        let year: Int = calendar.component(.year, from: result!)
        
        let hour: Int = calendar.component(.hour, from: result!)
        let minutes: Int = calendar.component(.minute, from: result!)
        let seconds: Int = calendar.component(.second, from: result!)
        let mseconds: Int = calendar.component(.nanosecond, from: result!)
        
        XCTAssertTrue(day == 14)
        XCTAssertTrue(month == 12)
        XCTAssertTrue(year == 2018)
        XCTAssertTrue(hour == 18)
        XCTAssertTrue(minutes == 07)
        XCTAssertTrue(seconds == 33)
        XCTAssertTrue(mseconds == 000)
    }

    func testFromBase64URLToBase64() {

        let base64URLString: String = "eyAibXNnX2VuIjogIkhlbGxvIiwKICAibXNnX2pwIjogIuOBk-OCk-OBq-OBoeOBryIsCiAgIm1zZ19jbiI6ICLkvaDlpb0iLAogICJtc2dfa3IiOiAi7JWI64WV7ZWY7IS47JqUIiwKICAibXNnX3J1IjogItCX0LTRgNCw0LLRgdGC0LLRg9C50YLQtSEiLAogICJtc2dfZGUiOiAiR3LDvMOfIEdvdHQiIH0"

        let base64String: String = HATFormatterHelper.fromBase64URLToBase64(stringToConvert: base64URLString)

        XCTAssertTrue(base64String == "eyAibXNnX2VuIjogIkhlbGxvIiwKICAibXNnX2pwIjogIuOBk+OCk+OBq+OBoeOBryIsCiAgIm1zZ19jbiI6ICLkvaDlpb0iLAogICJtc2dfa3IiOiAi7JWI64WV7ZWY7IS47JqUIiwKICAibXNnX3J1IjogItCX0LTRgNCw0LLRgdGC0LLRg9C50YLQtSEiLAogICJtc2dfZGUiOiAiR3LDvMOfIEdvdHQiIH0=")
    }
    
    func testFromBase64URLToBase642() {
        
        let base64URLString: String = "FRER-R"
        
        let base64String: String = HATFormatterHelper.fromBase64URLToBase64(stringToConvert: base64URLString)
        
        XCTAssertTrue(base64String == "FRER+R==")
    }
    
    func testformatDateToISO() {
        
        let date: Date = Date(timeIntervalSince1970: Double(1544794794))
        let dateString: String = HATFormatterHelper.formatDateToISO(date: date)
        
        XCTAssertTrue(dateString == "2018-12-14T13:39:54Z")
    }

}
