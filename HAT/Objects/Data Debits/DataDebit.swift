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

import SwiftyJSON

// MARK: Struct

public struct DataDebit: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `dataDebitKey` in JSON is `dataDebitKey`
     * `dateCreated` in JSON is `dateCreated`
     * `permissions` in JSON is `permissions`
     * `requestClientName` in JSON is `requestClientName`
     * `requestClientUrl` in JSON is `requestClientUrl`
     * `requestClientLogoUrl` in JSON is `requestClientLogoUrl`
     * `requestDescription` in JSON is `requestDescription`
     * `requestApplicationId` in JSON is `requestApplicationId`
     * `isActive` in JSON is `active`
     * `isAccepted` in JSON is `accepted`
     * `startDate` in JSON is `start`
     * `endDate` in JSON is `end`
     * `activePermissions` in JSON is `permissionsLatest`
     * `latestPermissions` in JSON is `requestApplicationId`
     */
    private enum CodingKeys: String, CodingKey {
        
        case dataDebitKey = "dataDebitKey"
        case dateCreated = "dateCreated"
        case permissions = "permissions"
        case requestClientName = "requestClientName"
        case requestClientUrl = "requestClientUrl"
        case requestClientLogoUrl = "requestClientLogoUrl"
        case requestDescription = "requestDescription"
        case requestApplicationId = "requestApplicationId"
        case isActive = "active"
        case isAccepted = "accepted"
        case startDate = "start"
        case endDate = "end"
        case activePermissions = "permissionsActive"
        case latestPermissions = "permissionsLatest"
    }
    
    // MARK: - Variables
    
    /// The data debit key
    public var dataDebitKey: String = ""
    /// The date created of the data debit
    public var dateCreated: String = ""
    /// The permissions of the data debit
    public var permissions: [DataDebitPermissions] = []
    /// The client name of the data debit
    public var requestClientName: String = ""
    /// The client url of the data debit
    public var requestClientUrl: String = ""
    /// The client logo URL of the data debit
    public var requestClientLogoUrl: String = ""
    /// The description of the data debit
    public var requestDescription: String?
    /// The id of the application, if the data debit is an application
    public var requestApplicationId: String?
    /// Is data debit active?
    public var isActive: Bool = false
    /// Is data debit accepted?
    public var isAccepted: Bool = false
    /// The start date of the data debit
    public var startDate: String?
    /// The end date of the data debit
    public var endDate: String?
    /// Are permissions still active
    public var activePermissions: DataDebitPermissions?
    /// The last permission set
    public var latestPermissions: DataDebitPermissions = DataDebitPermissions()
}
