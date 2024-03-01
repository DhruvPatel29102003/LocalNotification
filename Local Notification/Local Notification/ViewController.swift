//
//  ViewController.swift
//  Local Notification
//
//  Created by Droadmin on 7/31/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First"
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) {
            // ish line se user se parmission magi jati he
            success, error in
            if success {
                print("All set!")
            } else  {
                print("error")
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func notificatonBtn(_ sender: Any) {
       
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.body = "My name is dhruv"
        content.sound = .default
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        
        let request = UNNotificationRequest(identifier: "hello", content: content, trigger: trigger)
        notificationCenter.add(request)
 }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound,.banner])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(thirdVC, animated: true)
        completionHandler()
    }

}
                                                                   
