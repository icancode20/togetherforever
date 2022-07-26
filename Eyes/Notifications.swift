//
//  Notifications.swift
//  Eyes
//
//  Created by HomeMac on 7/26/22.
//

import SwiftUI
import UserNotifications

class Notifications{
    static let instance = Notifications () // Singleton
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print ("ERROR: \(error)")
            } else {
                print ("SUCCESS")
            }
        }
    }
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Time to take a break!"
        content.subtitle = "Do Yoga"
        content.sound = .default
        content.badge = 1
        // time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval:60.0, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct LocalNotification: View {
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20)
            shape.fill().foregroundColor(.black)
            shape.strokeBorder(lineWidth:3).colorInvert()
            
            VStack(spacing: 80) {
                Button("Request permission") {
                    Notifications.instance.requestAuthorization()
                    Notifications.instance.scheduleNotification()
                }
            }
        }
        
    }
}

struct LocalNotification_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotification()
    }
}
