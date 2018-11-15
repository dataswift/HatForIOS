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

public struct DataDebitCreationObject: HATObject {
    
    // MARK: - Variables
    
    public var dataDebitKey: String = ""
    public var purpose: String = ""
    public var start: String = ""
    public var period: Double = 0
    public var termsUrl: String = ""
    public var cancelAtPeriodEnd: Bool = false
    public var requestClientName: String = ""
    public var requestClientUrl: String = ""
    public var requestClientLogoUrl: String = ""
    public var requestApplicationId: String? = ""
    public var requestDescription: String? = ""
    public var conditions: DataOfferRequiredDataDefinitionObjectV2?
    public var bundle: DataOfferRequiredDataDefinitionObjectV2 = DataOfferRequiredDataDefinitionObjectV2()
    
    // MARK: - Initializer
    
    public init(dataDebitKey: String, purpose: String, start: String, period: Double, termsUrl: String, cancelAtPeriodEnd: Bool, requestClientName: String, requestClientUrl: String, requestClientLogoUrl: String, bundle: DataOfferRequiredDataDefinitionObjectV2) {
        
        self.dataDebitKey = dataDebitKey
        self.purpose = purpose
        self.start = start
        self.period = period
        self.termsUrl = termsUrl
        self.cancelAtPeriodEnd = cancelAtPeriodEnd
        self.requestClientName = requestClientName
        self.requestClientUrl = requestClientUrl
        self.requestClientLogoUrl = requestClientLogoUrl
        self.bundle = bundle
    }
    
    public init() {
        
    }
}
