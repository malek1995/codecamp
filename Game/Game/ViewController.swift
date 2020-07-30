//
//  ViewController.swift
//  Game
//
//  Created by Codecamp on 27.07.20.
//  Copyright © 2020 Codecamp. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var birdImage: UIImageView!
    @IBOutlet weak var gameBackGround: UIImageView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var healthBar: UIProgressView!
    @IBOutlet weak var careBar: UIProgressView!
    @IBOutlet weak var drinkBar: UIProgressView!
    @IBOutlet weak var foodBar: UIProgressView!
    
    var value1:Float = 1.0
    var value2:Float = 1.0
    var value3:Float = 1.0
    var value4:Float = 1.0
    var timer1:Timer!
    var timer2:Timer!
    var timer3:Timer!
    var timer4:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        healthBar.transform = healthBar.transform.scaledBy(x: 1, y: 2)
        drinkBar.transform = drinkBar.transform.scaledBy(x: 1, y: 2)
        foodBar.transform = foodBar.transform.scaledBy(x: 1, y: 2)
        careBar.transform = careBar.transform.scaledBy(x: 1, y: 2)
        
        timer1 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector:#selector(update), userInfo: nil, repeats: true)
        /*timer2 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(update), userInfo: nil, repeats: true)
        timer3 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(update), userInfo: nil, repeats: true)
        timer4 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(update), userInfo: nil, repeats: true)*/
        
    }
    
    @objc func update(){
        value1 = value1 - 0.1
        healthBar.setProgress(value1, animated: true)
        
        if value1 <= 0.8 {
            value2 = value2 - 0.1
            drinkBar.setProgress(value2, animated: true)
        }
        
         if value2 <= 0.8 {
            value3 = value3 - 0.1
            foodBar.setProgress(value3, animated: true)
            
        }
        
         if value3 <= 0.8 {
            value4 = value4 - 0.1
            careBar.setProgress(value4, animated: true)
        }
        
        if value1 <= 0.0
        {
            timer1.invalidate()
            timer1 = nil
            createAlert(title: "warning", message:"i´m sick Dad :(")
            
        }
        
        if value2 <= 0.0
        {
            timer1.invalidate()
            timer1 = nil
            createAlert(title: "warning", message:"I'm thirsty Dad :(")
        }
        
        if value3 <= 0.0
        {
            timer1.invalidate()
            timer1 = nil
            createAlert(title: "warning", message:"I'm hungry Dad :(")
        }
        
        if value4 <= 0.0
        {
            timer1.invalidate()
            timer1 = nil
            createAlert(title: "warning", message:"i need care Dad :(")
        }
        
    }
    
    func createAlert(title: String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.validateTime()
        }))
        
        alert.addAction(UIAlertAction(title: "not ok !", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))

        self.present(alert, animated: true, completion: nil)
    }

    func validateTime(){
        timer1 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector:#selector(update), userInfo: nil, repeats: true)
    }

}

 
