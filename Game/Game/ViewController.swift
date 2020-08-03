//
//  ViewController.swift
//  Game
//
//  Created by Codecamp on 27.07.20.
//  Copyright © 2020 Codecamp. All rights reserved.
//

import UIKit
import UserNotifications
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var birdImage: UIImageView!
    @IBOutlet weak var gameBackGround: UIImageView!
    @IBOutlet weak var healthBar: UIProgressView!
    @IBOutlet weak var careBar: UIProgressView!
    @IBOutlet weak var drinkBar: UIProgressView!
    @IBOutlet weak var foodBar: UIProgressView!
    @IBOutlet weak var healthButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var careButton: UIButton!
    
    var healthValue:Float = 1.0
    var drinkValue:Float = 1.0
    var foodValue:Float = 1.0
    var careValue:Float = 1.0
    
    var healthTimer:Timer!
    var drinkTimer:Timer!
    var foodTimer:Timer!
    var careTimer:Timer!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        healthBar.transform = healthBar.transform.scaledBy(x: 1, y: 2)
        drinkBar.transform = drinkBar.transform.scaledBy(x: 1, y: 2)
        foodBar.transform = foodBar.transform.scaledBy(x: 1, y: 2)
        careBar.transform = careBar.transform.scaledBy(x: 1, y: 2)
        
        //create timer for every progress view
        healthTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(updateHealthBar), userInfo: nil, repeats: true)
        drinkTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector:#selector(updateDrinkBar), userInfo: nil, repeats: true)
        foodTimer = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector:#selector(updateFoodBar), userInfo: nil, repeats: true)
        careTimer = Timer.scheduledTimer(timeInterval: 9.0, target: self, selector:#selector(updateCareBar), userInfo: nil, repeats: true)
        
    }
 
    //onClick health Button
    @IBAction func healthButton(_ sender: UIButton) {
        playSound(withName: "buttonSound")
        if healthValue <= 0 {
            healthTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(updateHealthBar), userInfo: nil, repeats: true)
            healthValue = healthValue + 0.1
        } else {
            healthValue = healthValue + 0.1
        }
    }
    
    //onClick food Button
    @IBAction func foodButton(_ sender: UIButton) {
         playSound(withName: "buttonSound")
        if foodValue <= 0 {
            foodTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector:#selector(updateFoodBar), userInfo: nil, repeats: true)
            foodValue = foodValue + 0.1
        } else {
            foodValue = foodValue + 0.1
        }
    }
    
    //onClick drink Button
    @IBAction func drinkButton(_ sender: UIButton) {
         playSound(withName: "buttonSound")
        if drinkValue <= 0 {
            drinkTimer = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector:#selector(updateDrinkBar), userInfo: nil, repeats: true)
            drinkValue = drinkValue + 0.1
        } else {
            drinkValue = drinkValue + 0.1
        }
    }
    
    //onClick care Button
    @IBAction func careButton(_ sender: UIButton) {
         playSound(withName: "buttonSound")
        if careValue <= 0 {
            careTimer = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector:#selector(updateCareBar), userInfo: nil, repeats: true)
            careValue = careValue + 0.1
        } else {
            careValue = careValue + 0.1
        }
    }
    
    //update health progress view
    @objc func updateHealthBar(){
        healthValue = healthValue - 0.1
        healthBar.setProgress(healthValue, animated: true)
        if healthValue <= 0.0
            {
                healthTimer.invalidate()
                healthTimer = nil
                createAlert(title: "warning", message:"i´m sick Dad :(")
               
                let center = UNUserNotificationCenter.current()
                center.requestAuthorization(options: [.alert, .sound]){
                (granted, error) in
                }
                let content = UNMutableNotificationContent()
                    content.title = "reminder"
                    content.body = "i´m sick Dad :("
                        
                let date = Date().addingTimeInterval(1)
                        
                let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
                        
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

                let uuidString = UUID().uuidString

                let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
                    center.add(request) { (error) in
                            // check sone error
                    }
            }
    }
    
    //update drink progressview
    @objc func updateDrinkBar(){
        drinkValue = drinkValue - 0.1
        drinkBar.setProgress(drinkValue, animated: true)
        if drinkValue <= 0.0
        {
            drinkTimer.invalidate()
            drinkTimer = nil
            createAlert(title: "warning", message:"I'm thirsty Dad :(")
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .sound]){
                (granted, error) in
            }
            
            let content = UNMutableNotificationContent()
                       content.title = "reminder"
                       content.body = "I'm thirsty Dad :("
            
            let date = Date().addingTimeInterval(1)
            
            let dateComponents =
                Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let uuidString = UUID().uuidString

            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            center.add(request) { (error) in
                // check sone error
            }
            
        }
        
    }
    
    //update food progress view
    @objc func updateFoodBar(){
        foodValue = foodValue - 0.1
        foodBar.setProgress(foodValue, animated: true)
        if foodValue <= 0.0
         {
            foodTimer.invalidate()
            foodTimer = nil
            createAlert(title: "warning", message:"I'm hungry Dad :(")
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .sound]){
                (granted, error) in
            }
            
            let content = UNMutableNotificationContent()
                       content.title = "reminder"
                       content.body = "I'm hungry Dad :("
            
            let date = Date().addingTimeInterval(1)
            
            let dateComponents =
                Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let uuidString = UUID().uuidString

            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            center.add(request) { (error) in
                // check sone error
            }
        }
    }
    
    //update care progress view
    @objc func updateCareBar(){
        careValue = careValue - 0.1
        careBar.setProgress(careValue, animated: true)
         if careValue <= 0.0
        {
            careTimer.invalidate()
            careTimer = nil
            createAlert(title: "warning", message:"i need care Dad :(")
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .sound]){
                (granted, error) in
            }
            
            let content = UNMutableNotificationContent()
                       content.title = "reminder"
                       content.body = "i need care Dad :("
            
            let date = Date().addingTimeInterval(1)
            
            let dateComponents =
                Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let uuidString = UUID().uuidString

            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            center.add(request) { (error) in
                // check sone error
            }
        }
    }

    //create alert message for every progressview
    func createAlert(title: String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        playSound(withName: "buttonSound")
        
        //alarm desepeare in 2 seconds
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
        alert.dismiss(animated: true, completion: nil)
            
        }
    }
    
     func playSound(withName name : String) {
         let sound = Bundle.main.url(forResource: name, withExtension: "wav")!
         audioPlayer = try! AVAudioPlayer(contentsOf: sound)
         audioPlayer.play()
     }


}

 
