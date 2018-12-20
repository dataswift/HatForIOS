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
    
    /// The names of the variables in the JSON received
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
    public var bundle: DataDefinitionObject = DataDefinitionObject()
    /// Some `Data Debits` can have some conditions attached to them. For example all the search for a `String` or search for a number to be `between` 2 numbers
    public var conditions: DataDefinitionObject?
}
