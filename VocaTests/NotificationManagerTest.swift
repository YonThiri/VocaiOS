//
//  VocaTests.swift
//  VocaTests
//
//  Created by Yon Thiri Aung on 07/07/2024.
//

import XCTest
@testable import Voca

final class NotificationManagerTest: XCTestCase {

    override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }

        func testRequestAuthorization() throws {
            // Arrange
            let expectation = self.expectation(description: "Request Authorization")

            // Act
            NotificationManager.instance.requestAuthorization()

            // Assert
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                UNUserNotificationCenter.current().getNotificationSettings { settings in
                    XCTAssertEqual(settings.authorizationStatus, .authorized)
                    expectation.fulfill()
                }
            }
            
            waitForExpectations(timeout: 2, handler: nil)
        }

        func testScheduleNotification() throws {
            // Arrange
            NotificationManager.instance.scheduleNotification()

            // Act
            let expectation = self.expectation(description: "Schedule Notification")
            
            UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
                // Assert
                XCTAssertEqual(requests.count, 1)
                
                let request = requests.first
                XCTAssertEqual(request?.content.title, "Today's word awaits!")
                XCTAssertEqual(request?.content.badge, 1)
                
                expectation.fulfill()
            }
            
            waitForExpectations(timeout: 2, handler: nil)
        }

}
