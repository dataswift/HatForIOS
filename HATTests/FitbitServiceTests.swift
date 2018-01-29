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

private struct Bodies {
    
    static let weightBody: [Dictionary<String, Any>] = [
        [
            "endpoint": "fitbit/weight",
            "recordId": "e28eea26-dfcd-4348-86d0-6b6f5e556de2",
            "data": [
                "bmi": 25.71,
                "fat": 21.613000869750977,
                "date": "2017-10-04",
                "time": "07:13:06",
                "logId": 123,
                "source": "Aria",
                "weight": 95.7
            ]
        ]
    ]
    static let dailyActivity: [Dictionary<String, Any>] = [
        [
            "endpoint": "fitbit/activity/day/summary",
            "recordId": "0be567dc-6b32-4583-b113-f3eed17f461c",
            "data": [
                "steps": 0,
                "floors": 0,
                "distances": [
                    [
                        "activity": "total",
                        "distance": 0
                    ],
                    [
                        "activity": "tracker",
                        "distance": 0
                    ],
                    [
                        "activity": "loggedActivities",
                        "distance": 0
                    ],
                    [
                        "activity": "veryActive",
                        "distance": 0
                    ],
                    [
                        "activity": "moderatelyActive",
                        "distance": 0
                    ],
                    [
                        "activity": "lightlyActive",
                        "distance": 0
                    ],
                    [
                        "activity": "sedentaryActive",
                        "distance": 0
                    ]
                ],
                "elevation": 0,
                "activeScore": -1,
                "caloriesBMR": 2038,
                "caloriesOut": 2038,
                "activityCalories": 0,
                "marginalCalories": 0,
                "sedentaryMinutes": 1440,
                "veryActiveMinutes": 0,
                "fairlyActiveMinutes": 0,
                "lightlyActiveMinutes": 0
            ]
        ]
    ]
    static let activity: [Dictionary<String, Any>] = [
        [
            "endpoint": "fitbit/activity",
            "recordId": "436b202b-f45b-4c41-bb1e-b9ceb23e26be",
            "data": [
                "logId": 423423,
                "steps": 3449,
                "logType": "auto_detected",
                "tcxLink": "https://api.fitbit.com/1/user/-/activities/6398976747.tcx",
                "calories": 348,
                "duration": 2473000,
                "startTime": "2017-03-03T21:00:35.000Z",
                "activityName": "Walk",
                "lastModified": "2017-03-03T21:54:57.000Z",
                "activityLevel": [
                    [
                        "name": "sedentary",
                        "minutes": 1
                    ],
                    [
                        "name": "lightly",
                        "minutes": 4
                    ],
                    [
                        "name": "fairly",
                        "minutes": 7
                    ],
                    [
                        "name": "very",
                        "minutes": 29
                    ]
                ],
                "elevationGain": 0,
                "heartRateLink": "https://api.fitbit.com/1/user/-/activities/heart/date/2017-03-03/2017-03-03/1sec/time/21:00:35/21:41:48.json",
                "activeDuration": 2473000,
                "activityTypeId": 90013,
                "heartRateZones": [
                    [
                        "max": 96,
                        "min": 30,
                        "name": "Out of Range",
                        "minutes": 10
                    ],
                    [
                        "max": 135,
                        "min": 96,
                        "name": "Fat Burn",
                        "minutes": 28
                    ],
                    [
                        "max": 164,
                        "min": 135,
                        "name": "Cardio",
                        "minutes": 1
                    ],
                    [
                        "max": 220,
                        "min": 164,
                        "name": "Peak",
                        "minutes": 0
                    ]
                ],
                "averageHeartRate": 105,
                "originalDuration": 2473000,
                "originalStartTime": "2017-03-03T21:00:35.000Z",
                "manualValuesSpecified": [
                    "steps": false,
                    "calories": false,
                    "distance": false
                ]
            ]
        ]
    ]
    static let lifetimeStats: [Dictionary<String, Any>] = [
        [
            "endpoint": "fitbit/lifetime/stats",
            "recordId": "cc434053-f4aa-456d-b6c7-a53d65017cdb",
            "data": [
                "best": [
                    "total": [
                        "steps": [
                            "date": "2016-11-26",
                            "value": 22469
                        ],
                        "floors": [
                            "date": "2016-11-12",
                            "value": 28.000000042560004
                        ],
                        "distance": [
                            "date": "2016-11-26",
                            "value": 17.99766
                        ]
                    ],
                    "tracker": [
                        "steps": [
                            "date": "2016-11-26",
                            "value": 22469
                        ],
                        "floors": [
                            "date": "2016-11-12",
                            "value": 28.000000042560004
                        ],
                        "distance": [
                            "date": "2016-11-26",
                            "value": 17.99766
                        ]
                    ]
                ],
                "lifetime": [
                    "total": [
                        "steps": 288528,
                        "floors": 661,
                        "distance": 227.77,
                        "activeScore": -1,
                        "caloriesOut": -1
                    ],
                    "tracker": [
                        "steps": 288528,
                        "floors": 661,
                        "distance": 227.77,
                        "activeScore": -1,
                        "caloriesOut": -1
                    ]
                ]
            ]
        ]
    ]
    static let profile: [Dictionary<String, Any>] = [
        [
            "endpoint": "fitbit/profile",
            "recordId": "2d616114-4aa2-46dc-9bd4-a75ccbe8e4b7",
            "data": [
                "age": 28,
                "avatar": "https://static0.fitbit.com/images/profile/defaultProfile_100_male.png",
                "gender": "MALE",
                "height": 193,
                "locale": "en_GB",
                "weight": 95.7,
                "features": [
                    "exerciseGoal": true
                ],
                "fullName": "Testing",
                "lastName": "",
                "swimUnit": "METRIC",
                "timezone": "Europe/London",
                "avatar150": "https://static0.fitbit.com/images/profile/defaultProfile_150_male.png",
                "avatar640": "https://static0.fitbit.com/images/profile/defaultProfile_640_male.png",
                "corporate": false,
                "encodedId": "52JQ2P",
                "firstName": "Testing",
                "topBadges": [
                    [
                        "name": "High Tops (20,000 steps in a day)",
                        "value": 20000,
                        "cheers": [],
                        "category": "Daily Steps",
                        "dateTime": "2016-11-26",
                        "badgeType": "DAILY_STEPS",
                        "encodedId": "228TPP",
                        "image50px": "https://static0.fitbit.com/images/badges_new/badge_daily_steps20k.png",
                        "image75px": "https://static0.fitbit.com/images/badges_new/75px/badge_daily_steps20k.png",
                        "shareText": "I took 20,000 steps and earned the High Tops badge! #Fitbit",
                        "shortName": "High Tops",
                        "image100px": "https://static0.fitbit.com/images/badges_new/100px/badge_daily_steps20k.png",
                        "image125px": "https://static0.fitbit.com/images/badges_new/125px/badge_daily_steps20k.png",
                        "image300px": "https://static0.fitbit.com/images/badges_new/300px/badge_daily_steps20k.png",
                        "description": "20,000 steps in a day",
                        "earnedMessage": "Congrats on earning your first High Tops badge!",
                        "timesAchieved": 1,
                        "shareImage640px": "https://static0.fitbit.com/images/badges_new/386px/shareLocalized/en_US/badge_daily_steps20k.png",
                        "shortDescription": "20,000 steps",
                        "mobileDescription": "When it comes to steps, it looks like you're not playing around. This achievement was a slam dunk.",
                        "marketingDescription": "You've walked 20,000 steps  And earned the High Tops badge!",
                        "badgeGradientEndColor": "A489E8",
                        "badgeGradientStartColor": "38216E"
                    ],
                    [
                        "name": "Penguin March (112 lifetime kilometers)",
                        "unit": "KILOMETERS",
                        "value": 112,
                        "cheers": [],
                        "category": "Lifetime Distance",
                        "dateTime": "2017-01-05",
                        "badgeType": "LIFETIME_DISTANCE",
                        "encodedId": "22B8LP",
                        "image50px": "https://static0.fitbit.com/images/badges_new/badge_lifetime_miles70.png",
                        "image75px": "https://static0.fitbit.com/images/badges_new/75px/badge_lifetime_miles70.png",
                        "shareText": "I covered 112 kilometers with my #Fitbit and earned the Penguin March badge.",
                        "shortName": "Penguin March",
                        "image100px": "https://static0.fitbit.com/images/badges_new/100px/badge_lifetime_miles70.png",
                        "image125px": "https://static0.fitbit.com/images/badges_new/125px/badge_lifetime_miles70.png",
                        "image300px": "https://static0.fitbit.com/images/badges_new/300px/badge_lifetime_miles70.png",
                        "description": "112 lifetime kilometers",
                        "earnedMessage": "Whoa! You've earned the Penguin March badge!",
                        "timesAchieved": 1,
                        "shareImage640px": "https://static0.fitbit.com/images/badges_new/386px/shareLocalized/en_US/badge_lifetime_miles70_km.png",
                        "shortDescription": "112 kilometers",
                        "mobileDescription": "You matched the distance of the March of the Penguins—the annual trip emperor penguins make to their breeding grounds.",
                        "marketingDescription": "By reaching 112 lifetime kilometers, you've earned the Penguin March badge!",
                        "badgeGradientEndColor": "38D7FF",
                        "badgeGradientStartColor": "2DB4D7"
                    ],
                    [
                        "name": "Redwood Forest (25 floors in a day)",
                        "value": 25,
                        "cheers": [],
                        "category": "Daily Climb",
                        "dateTime": "2017-01-13",
                        "badgeType": "DAILY_FLOORS",
                        "encodedId": "228TSZ",
                        "image50px": "https://static0.fitbit.com/images/badges_new/badge_daily_floors25.png",
                        "image75px": "https://static0.fitbit.com/images/badges_new/75px/badge_daily_floors25.png",
                        "shareText": "I climbed 25 flights of stairs and earned the Redwood Forest badge! #Fitbit",
                        "shortName": "Redwood Forest",
                        "image100px": "https://static0.fitbit.com/images/badges_new/100px/badge_daily_floors25.png",
                        "image125px": "https://static0.fitbit.com/images/badges_new/125px/badge_daily_floors25.png",
                        "image300px": "https://static0.fitbit.com/images/badges_new/300px/badge_daily_floors25.png",
                        "description": "25 floors in a day",
                        "earnedMessage": "Congrats on earning your first Redwood Forest badge!",
                        "timesAchieved": 3,
                        "shareImage640px": "https://static0.fitbit.com/images/badges_new/386px/shareLocalized/en_US/badge_daily_floors25.png",
                        "shortDescription": "25 floors",
                        "mobileDescription": "The tallest trees on Earth can't top the heights you've been conquering.",
                        "marketingDescription": "You've climbed 25 floors to earn the Redwood Forest badge!",
                        "badgeGradientEndColor": "B0DF2A",
                        "badgeGradientStartColor": "00A550"
                    ],
                    [
                        "name": "Helicopter (500 lifetime floors)",
                        "value": 500,
                        "cheers": [],
                        "category": "Lifetime Climb",
                        "dateTime": "2017-01-30",
                        "badgeType": "LIFETIME_FLOORS",
                        "encodedId": "228TB8",
                        "image50px": "https://static0.fitbit.com/images/badges_new/badge_lifetime_floors500.png",
                        "image75px": "https://static0.fitbit.com/images/badges_new/75px/badge_lifetime_floors500.png",
                        "shareText": "I climbed 500 floors with my #Fitbit and earned the Helicopter badge.",
                        "shortName": "Helicopter",
                        "image100px": "https://static0.fitbit.com/images/badges_new/100px/badge_lifetime_floors500.png",
                        "image125px": "https://static0.fitbit.com/images/badges_new/125px/badge_lifetime_floors500.png",
                        "image300px": "https://static0.fitbit.com/images/badges_new/300px/badge_lifetime_floors500.png",
                        "description": "500 lifetime floors",
                        "earnedMessage": "Yipee! You've earned the Helicopter badge!",
                        "timesAchieved": 1,
                        "shareImage640px": "https://static0.fitbit.com/images/badges_new/386px/shareLocalized/en_US/badge_lifetime_floors500.png",
                        "shortDescription": "500 floors",
                        "mobileDescription": "That's the altitude of a helicopter. Heli-yes, you totally just did that!",
                        "marketingDescription": "By climbing 500 lifetime floors, you've earned the Helicopter badge!",
                        "badgeGradientEndColor": "FFDB01",
                        "badgeGradientStartColor": "D99123"
                    ]
                ],
                "ambassador": false,
                "heightUnit": "METRIC",
                "mfaEnabled": false,
                "weightUnit": "METRIC",
                "dateOfBirth": "1989-07-12",
                "displayName": "Andrius",
                "glucoseUnit": "METRIC",
                "memberSince": "2016-11-10",
                "distanceUnit": "METRIC",
                "corporateAdmin": false,
                "startDayOfWeek": "MONDAY",
                "averageDailySteps": 0,
                "displayNameSetting": "name",
                "offsetFromUTCMillis": 3600000,
                "strideLengthRunning": 117,
                "strideLengthWalking": 80.10000000000001,
                "clockTimeDisplayFormat": "12hour",
                "strideLengthRunningType": "default",
                "strideLengthWalkingType": "default"
            ]
        ]
    ]
    static let sleep: [Dictionary<String, Any>] = [
        [
            "endpoint": "fitbit/sleep",
            "recordId": "14dba31e-8fa8-4f59-ba88-c6e5d21b7499",
            "data": [
                "type": "classic",
                "logId": 432423,
                "levels": [
                    "data": [
                        [
                            "level": "restless",
                            "seconds": 660,
                            "dateTime": "2017-06-01T19:25:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-01T19:36:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-01T19:37:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-01T19:38:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 420,
                            "dateTime": "2017-06-01T19:39:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-01T19:46:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-01T19:47:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-01T19:48:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 1020,
                            "dateTime": "2017-06-01T19:49:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 240,
                            "dateTime": "2017-06-01T20:06:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 660,
                            "dateTime": "2017-06-01T20:10:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-01T20:21:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 1620,
                            "dateTime": "2017-06-01T20:22:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-01T20:49:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 240,
                            "dateTime": "2017-06-01T20:50:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 1200,
                            "dateTime": "2017-06-01T20:54:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 240,
                            "dateTime": "2017-06-01T21:14:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 300,
                            "dateTime": "2017-06-01T21:18:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 780,
                            "dateTime": "2017-06-01T21:23:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-01T21:36:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 120,
                            "dateTime": "2017-06-01T21:37:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-01T21:39:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 360,
                            "dateTime": "2017-06-01T21:40:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 960,
                            "dateTime": "2017-06-01T21:46:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 120,
                            "dateTime": "2017-06-01T22:02:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 600,
                            "dateTime": "2017-06-01T22:04:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-01T22:14:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-01T22:15:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 780,
                            "dateTime": "2017-06-01T22:16:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-01T22:29:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 32820,
                            "dateTime": "2017-06-01T22:30:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-02T07:37:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-02T07:38:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 180,
                            "dateTime": "2017-06-02T07:39:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 120,
                            "dateTime": "2017-06-02T07:42:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-02T07:44:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 660,
                            "dateTime": "2017-06-02T07:45:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-02T07:56:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 180,
                            "dateTime": "2017-06-02T07:57:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 1140,
                            "dateTime": "2017-06-02T08:00:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-02T08:19:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 240,
                            "dateTime": "2017-06-02T08:20:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 900,
                            "dateTime": "2017-06-02T08:24:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-02T08:39:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 1020,
                            "dateTime": "2017-06-02T08:40:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 120,
                            "dateTime": "2017-06-02T08:57:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 180,
                            "dateTime": "2017-06-02T08:59:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-02T09:02:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 180,
                            "dateTime": "2017-06-02T09:03:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 120,
                            "dateTime": "2017-06-02T09:06:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 480,
                            "dateTime": "2017-06-02T09:08:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-02T09:16:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 120,
                            "dateTime": "2017-06-02T09:17:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 60,
                            "dateTime": "2017-06-02T09:19:00.000"
                        ],
                        [
                            "level": "awake",
                            "seconds": 60,
                            "dateTime": "2017-06-02T09:20:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 240,
                            "dateTime": "2017-06-02T09:21:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 420,
                            "dateTime": "2017-06-02T09:25:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 5580,
                            "dateTime": "2017-06-02T09:32:00.000"
                        ],
                        [
                            "level": "restless",
                            "seconds": 60,
                            "dateTime": "2017-06-02T11:05:00.000"
                        ],
                        [
                            "level": "asleep",
                            "seconds": 1200,
                            "dateTime": "2017-06-02T11:06:00.000"
                        ]
                    ],
                    "summary": [
                        "awake": [
                            "count": 22,
                            "minutes": 91
                        ],
                        "asleep": [
                            "count": 0,
                            "minutes": 736
                        ],
                        "restless": [
                            "count": 27,
                            "minutes": 134
                        ]
                    ]
                ],
                "endTime": "2017-06-02T11:26:00.000",
                "duration": 57660000,
                "infoCode": 0,
                "startTime": "2017-06-01T19:25:00.000",
                "timeInBed": 961,
                "efficiency": 90,
                "dateOfSleep": "2017-06-02",
                "minutesAwake": 84,
                "minutesAsleep": 736,
                "minutesAfterWakeup": 0,
                "minutesToFallAsleep": 141
            ]
        ]
    ]
}

private let userToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJleUp3Y205MmFXUmxja2xFSWpvaVkzSmxaR1Z1ZEdsaGJITWlMQ0p3Y205MmFXUmxja3RsZVNJNkluUmxjM1JwYm1jaWZRPT0iLCJyZXNvdXJjZSI6InRlc3RpbmcuaHViYXQubmV0IiwiYWNjZXNzU2NvcGUiOiJvd25lciIsImlzcyI6InRlc3RpbmcuaHViYXQubmV0IiwiZXhwIjoxNTA3NjYxODMzLCJpYXQiOjE1MDc0MDI2MzMsImp0aSI6Ijc1ZmMxMzFkODg3OWNkY2MyMDQyZTZhOTkyMTBiOGU5YzQzYTI2Mjk0OTI4NzI5YWExOWFlODNhZWJjOWNhMjZjZWQzZDRhOTg3Y2I1YWE3YmM2MWFkODkxYTgyMGQzOTJiYTA0ZTE3ZWVkNzViMTg0NjExYWFkZDM1NjI0NDIzMDY1OTgyZWNiZTNlMGE1NDQxYjBkYjU3N2QyNDVlOGQ0NWI5NzhlNjFjM2MwMmEzMTMwYWU1NjI5NWJiMjIxNWJjNGM5OTQ0YjFlMTQzYzMwMTA5OTk2MzM1YTUwOTE4MmYzYzdmY2UxNWE1MTk5ODM5YjE5YWQyZWZlYjdlMDIifQ.kMpP8TYpmudTf41sYBVRz6dz5OboIkkBlyZvfYf8fgTE1BK8zv1X36lqQnagQsHvECcsUqxOsDGrnxpaL1BlO6mLZreRdVy8xojfCL_EVKxvvwEOmjQsQ5dgxeF8Q4-y9JoIQbsgAnf3ux8-F0i4dFR5wOeuBy_Q0oouV3Bmxeupf8r_nO7m_YeustaCtNpura9nTvs7AM-uL9BZUXZPBwi4LEnZi67zt6pFeZC8zTIinBimYB3BjFJuH4Mwlfrn-0S_K-Q0cbsQueCT7B3-qp2a3tgCke5EsJh8b1RXMa68p4gEYOQM_8ZLZc9M5GzQQs4vFKjXrD9CWkbXYVySvQ"

internal class FitbitServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetWeight() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectationTest = expectation(description: "Get weight data from fitbit...")
        
        func success(weight: [HATFitbitWeightObject], newToken: String?) {
            
            XCTAssertTrue(weight[0].bmi == 25.71)
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2/data/fitbit/weight?take=1"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(Bodies.weightBody))
        
        HATFitbitService.getWeight(
            userDomain: userDomain,
            userToken: userToken,
            parameters: ["take": "1"],
            successCallback: success,
            errorCallback: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetDailyActivity() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectationTest = expectation(description: "Get daily activity data from fitbit...")
        
        func success(dailyActivity: [HATFitbitDailyActivityObject], newToken: String?) {
            
            XCTAssertTrue(dailyActivity[0].steps == 0)
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2/data/fitbit/activity/day/summary?take=1"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(Bodies.dailyActivity))
        
        HATFitbitService.getDailyActivity(
            userDomain: userDomain,
            userToken: userToken,
            parameters: ["take": "1"],
            successCallback: success,
            errorCallback: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testActivity() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectationTest = expectation(description: "Get activity data from fitbit...")
        
        func success(activity: [HATFitbitActivityObject], newToken: String?) {
            
            XCTAssertTrue(activity[0].logId == 423423)
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2/data/fitbit/activity?take=1"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(Bodies.activity))
        
        HATFitbitService.getActivity(
            userDomain: userDomain,
            userToken: userToken,
            parameters: ["take": "1"],
            successCallback: success,
            errorCallback: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testLifetimeStats() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectationTest = expectation(description: "Get lifetime stats data from fitbit...")
        
        func success(stats: [HATFitbitStatsObject], newToken: String?) {
            
            XCTAssertTrue(stats[0].best.total.steps.value == 22469)
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2/data/fitbit/lifetime/stats?take=1"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(Bodies.lifetimeStats))
        
        HATFitbitService.getLifetimeStats(
            userDomain: userDomain,
            userToken: userToken,
            parameters: ["take": "1"],
            successCallback: success,
            errorCallback: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetProfile() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectationTest = expectation(description: "Get profile data from fitbit...")
        
        func success(profile: [HATFitbitProfileObject], newToken: String?) {
            
            XCTAssertTrue(profile[0].age == 28)
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2/data/fitbit/profile?take=1"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(Bodies.profile))
        
        HATFitbitService.getProfile(
            userDomain: userDomain,
            userToken: userToken,
            parameters: ["take": "1"],
            successCallback: success,
            errorCallback: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetSleep() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectationTest = expectation(description: "Get sleep data from fitbit...")

        func success(sleep: [HATFitbitSleepObject], newToken: String?) {
            
            XCTAssertTrue(sleep[0].type == "classic")
            expectationTest.fulfill()
        }
        
        func fail(error: HATTableError) {
            
        }
        
        let userDomain = "testing.hubat.net"
        let urlToConnect = "https://testing.hubat.net/api/v2/data/fitbit/sleep?take=1"
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(Bodies.sleep))
        
        HATFitbitService.getSleep(
            userDomain: userDomain,
            userToken: userToken,
            parameters: ["take": "1"],
            successCallback: success,
            errorCallback: fail)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGettingFitbitToken() {
        
        let body: Dictionary<String, Any> = ["accessToken": "token"]
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://\(userDomain)/users/application_token?name=fitbit&resource=fitbit"
        
        let expectationTest = expectation(description: "Getting app token for Fitbit...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(fitbitToken: String, newUserToken: String?) {
            
            XCTAssertTrue(fitbitToken == "token")
            expectationTest.fulfill()
        }
        
        func failed(error: JSONParsingError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFitbitService.getApplicationTokenForFitbit(userDomain: userDomain, userToken: userToken, dataPlugURL: "fitbit", successCallback: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testIsFitbitEnabled() {
        
        let body: Dictionary<String, Any> = ["accessToken": "token"]
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://\(userDomain)/users/application_token?name=fitbit&resource=fitbit"
        
        let expectationTest = expectation(description: "Getting app token for Fitbit...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(isFitbitEnabled: Bool, newUserToken: String?) {
            
            XCTAssertTrue(isFitbitEnabled)
            expectationTest.fulfill()
        }
        
        func failed(error: JSONParsingError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFitbitService.checkIfFitbitIsEnabled(userDomain: userDomain, userToken: "", plugURL: "fitbit", statusURL: "fitbit", successCallback: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetFitbitEndpoints() {
        
        let body: [Dictionary<String, Any>] = [[
            "namespace": "fitbit",
            "endpoints": [
                [
                    "endpoint": "weight",
                    "fields": [
                        [
                            "name": "weight",
                            "count": 33
                        ],
                        [
                            "name": "bmi",
                            "count": 33
                        ],
                        [
                            "name": "source",
                            "count": 33
                        ],
                        [
                            "name": "date",
                            "count": 33
                        ],
                        [
                            "name": "fat",
                            "count": 33
                        ],
                        [
                            "name": "logId",
                            "count": 33
                        ],
                        [
                            "name": "time",
                            "count": 33
                        ]
                    ]
                ]
            ]
        ]]
        let userDomain = "mariostsekis.hubofallthings.net"
        let urlToConnect = "https://dex.hubofallthings.com/stats/available-data"
        
        let expectationTest = expectation(description: "Getting app token for Fitbit...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(endpoints: [String], newUserToken: String?) {
            
            XCTAssertTrue(!endpoints.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: HATTableError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATFitbitService.getFitbitEndpoints(successCallback: completion, errorCallback: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
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
