//
//  Food.swift
//  Game
//
//  Created by Codecamp on 30.07.20.
//  Copyright © 2020 Codecamp. All rights reserved.
//

import Foundation
import UIKit

class WishMaker{
    
    var price:Int? = nil
    var name:String? = nil
    var addToHealth:Int? = nil
    var addToFood:Int? = nil
    var type:String? = nil
    var addToDrink:Int? = nil
    var addToCare:Int? = nil
  
    func makeDrink(price:Int, name:String, addToHealth:Int, addToDrink:Int){
        self.price = price
        self.name = name
        self.addToDrink = addToDrink
        self.addToHealth = addToHealth
        self.addToCare = 0
        self.addToFood = 0
        self.type = "Drink"
    }
    
    func makeFood(price:Int, name:String, addToHealth:Int, addToFood:Int){
        self.price = price
        self.name = name
        self.addToDrink = 0
        self.addToHealth = addToHealth
        self.addToCare = 0
        self.addToFood = addToFood
        self.type = "Food"
    }
    
    func makeCare(price:Int, name:String, addToHealth:Int, addToCare:Int){
        self.price = price
        self.name = name
        self.addToDrink = 0
        self.addToHealth = addToHealth
        self.addToCare = addToCare
        self.addToFood = 0
        self.type = "Care"
    }
    
    func setPrice(price: Int){
        self.price = price
    }
    
    func getPrice() -> Int {
        return self.price!
    }
    
    func setName(name: String){
        self.name = name
    }
    
    func getName() -> String{
        return self.name!
    }
    
    func setAddToHealth(addToHealth: Int){
        self.addToHealth = addToHealth
    }
    
    func getAddToHealth() -> Int{
        return self.addToHealth!
    }
    
    func setAddtoFood(addToFood: Int){
        self.addToFood = addToFood
    }
    
    func getAddToFood() -> Int {
        return self.addToFood!
    }
    
    func setType(type: String){
        self.type = type
    }
    
    func getType() -> String {
        return self.type!
    }
    
    func setAddToDrink(addToDrink: Int){
        self.addToDrink = addToDrink
    }
    
    func getAddToDrink() -> Int {
        return self.addToDrink!
    }
    
    func setAddToCare(addToCare:Int)  {
        self.addToCare = addToCare
    }
    
    func getAddToCare() -> Int {
        return self.addToCare!
    }
    
}
