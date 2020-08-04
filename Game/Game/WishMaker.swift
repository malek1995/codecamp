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
    var addToHealth:Float? = nil
    var addToFood:Float? = nil
    var type:String? = nil
    var addToDrink:Float? = nil
    var addToCare:Float? = nil
  
    func makeDrink(price:Int, name:String, addToHealth:Float, addToDrink:Float){
        self.price = price
        self.name = name
        self.addToDrink = addToDrink
        self.addToHealth = addToHealth
        self.addToCare = 0
        self.addToFood = 0
        self.type = "Drink"
    }
    
    func makeFood(price:Int, name:String, addToHealth:Float, addToFood:Float){
        self.price = price
        self.name = name
        self.addToDrink = 0
        self.addToHealth = addToHealth
        self.addToCare = 0
        self.addToFood = addToFood
        self.type = "Food"
    }
    
    func makeCare(price:Int, name:String, addToHealth:Float, addToCare:Float){
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
    
    func setAddToHealth(addToHealth: Float){
        self.addToHealth = addToHealth
    }
    
    func getAddToHealth() -> Float{
        return self.addToHealth!
    }
    
    func setAddtoFood(addToFood: Float){
        self.addToFood = addToFood
    }
    
    func getAddToFood() -> Float {
        return self.addToFood!
    }
    
    func setType(type: String){
        self.type = type
    }
    
    func getType() -> String {
        return self.type!
    }
    
    func setAddToDrink(addToDrink: Float){
        self.addToDrink = addToDrink
    }
    
    func getAddToDrink() -> Float {
        return self.addToDrink!
    }
    
    func setAddToCare(addToCare:Float)  {
        self.addToCare = addToCare
    }
    
    func getAddToCare() -> Float {
        return self.addToCare!
    }
    
}
