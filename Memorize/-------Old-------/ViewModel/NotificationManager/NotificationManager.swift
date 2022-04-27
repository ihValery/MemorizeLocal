//
//  NotificationManager.swift
//  Notification
//
//  Created by Валерий Игнатьев on 11.05.21.
//

import SwiftUI
import NotificationCenter

final class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    //MARK: - Properties
    
    static let shared = NotificationManager()
    
    private let center = UNUserNotificationCenter.current()
    
    //MARK: - Public Methods
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
}

//MARK: - SomeProtocol

extension NotificationManager {
    
    //MARK: - Public Methods
    
    func getNotification(onDenied handler: (() -> Void)? = nil) {
        center.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestPermission()
            case .denied:
                if let handler = handler { handler() }
            default:
                break
            }
        }
        center.delegate = self
    }
    
    ///Создание содержимого для локального уведомления
    func sceduleNotification(date: Date) {
        let content = UNMutableNotificationContent()
        
        content.body = "10 минут, на простые упражнения, и мозг будет работать намного эффективнее."
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let currDate = dateForAlarm(date: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: currDate, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        //Вызов .add с тем же identifire заменит уведомление
        center.add(request)
    }
    
    func removeNotification() {
        center.removeAllDeliveredNotifications()
        center.removeAllPendingNotificationRequests()
    }
    
    //MARK: - Private Methods
    
    ///Запрос на использование Notification.
    private func requestPermission() {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { _,_ in }
    }
    
    private func dateForAlarm(date: Date) -> DateComponents {
        return Calendar.current.dateComponents([.hour, .minute], from: date)
    }
    
}
