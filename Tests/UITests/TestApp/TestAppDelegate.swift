//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

@preconcurrency import HealthKit
import Spezi
import SpeziHealthKit
import XCTSpezi


class TestAppDelegate: SpeziAppDelegate {
    override var configuration: Configuration {
        Configuration(standard: TestAppStandard()) {
            HealthKit<TestAppStandard> {
                CollectSample(
                    HKQuantityType.electrocardiogramType(),
                    deliverySetting: .background(.manual)
                )
                CollectSample(
                    HKQuantityType(.stepCount),
                    deliverySetting: .background(.afterAuthorizationAndApplicationWillLaunch)
                )
                CollectSample(
                    HKQuantityType(.pushCount),
                    deliverySetting: .anchorQuery(.manual)
                )
                CollectSample(
                    HKQuantityType(.activeEnergyBurned),
                    deliverySetting: .anchorQuery(.afterAuthorizationAndApplicationWillLaunch)
                )
                CollectSample(
                    HKQuantityType(.restingHeartRate),
                    deliverySetting: .manual()
                )
            } adapter: {
                TestAppHealthKitAdapter()
            }
        }
    }
}
