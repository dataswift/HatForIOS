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

// MARK: Struct

public struct DataDebitPermissions: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `dateCreated` in JSON is `dateCreated`
     * `purpose` in JSON is `purpose`
     * `startDate` in JSON is `start`
     * `period` in JSON is `period`
     * `endDate` in JSON is `end`
     * `willCancelAtPeriodsEnd` in JSON is `cancelAtPeriodEnd`
     * `termsUrl` in JSON is `termsUrl`
     * `isActive` in JSON is `active`
     * `isAccepted` in JSON is `accepted`
     * `conditions` in JSON is `conditions`
     * `bundle` in JSON is `bundle`
     */
    private enum CodingKeys: String, CodingKey {
        
        case dateCreated = "dateCreated"
        case purpose = "purpose"
        case startDate = "start"
        case period = "period"
        case endDate = "end"
        case willCancelAtPeriodsEnd = "cancelAtPeriodEnd"
        case termsUrl = "termsUrl"
        case isActive = "active"
        case isAccepted = "accepted"
        case conditions = "conditions"
        case bundle = "bundle"
    }

    // MARK: - Variables
    
    /// The created date of the permission
    public var dateCreated: String = ""
    /// The purpose of the permission
    public var purpose: String?
    /// The start date of the permission
    public var startDate: String?
    /// The end date of the permission
    public var endDate: String?
    /// A flag indicating if the permissions will auto cancel when the debit will end
    public var willCancelAtPeriodsEnd: Bool = false
    /// The terms and conditions URL for the permissions
    public var termsUrl: String?
    /// The period duration
    public var period: Int = 0
    /// Is the permission active
    public var isActive: Bool = false
    /// Is the permission accepted
    public var isAccepted: Bool = false
    /// It is possible for a permission to have an inner bundle object
    public var bundle: DataDefinition = DataDefinition()
    /// Some `Data Debits` can have some conditions attached to them. For example all the search for a `String` or search for a number to be `between` 2 numbers
    public var conditions: DataDefinition?
}
