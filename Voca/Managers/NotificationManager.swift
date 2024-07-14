//
//  NotificationManager.swift
//  Voca
//
//  Created by Yon Thiri Aung on 14/07/2024.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager()

    func requestAuthorization() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async { [weak self] in
                
                if granted {
                    self?.scheduleNotification()
                }
            }
        }
            
    }
    
    func scheduleNotification() {
        
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let messages = [
            "Relax and recharge for the week ahead!",
            "Expand your vocab today! 🌟",
            "Today's word awaits! 🔍",
            "Boost your vocab now! 💪",
            "Discover a new word! ✨",
            "Daily vocab boost! 🚀",
            "Learn today's word! 📚",
                
        ]
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: Date())
        let message = messages[weekday - 1]
        
        let content = UNMutableNotificationContent()
        content.title = "Today's word awaits!"
        content.subtitle = message
        content.sound = .default
        content.badge = 1
        
        // time
        /*
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        */
        
        // Calendar
        // Everyday at 8 AM
        var dateComponents = DateComponents()
        dateComponents.hour = 8
        dateComponents.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)

    }
}
