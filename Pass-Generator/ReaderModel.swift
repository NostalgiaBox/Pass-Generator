//
//  ReaderModel.swift
//  Pass-Generator
//
//  Created by Murray Fenstermaker on 7/10/18.
//  Copyright © 2018 Nostalgiabox. All rights reserved.
//

import Foundation

protocol Swipable {
    func swipe(pass: Pass)
}

class RideReader: Swipable {
    func swipe(pass: Pass) {
        if (pass.visitorType.rideAccess){
            print("Access Granted")
        } else {
            print("Access Denied")
        }
    }
    
    init(){
        
    }
}

class FoodReader: Swipable {
    func swipe(pass: Pass) {
        if let foodDiscount = pass.visitorType.foodDiscount {
            print("Food is discounted at \(foodDiscount)%")
        } else {
            print("No discount")
        }
    }
    
    init(){
        
    }
}

class MerchReader: Swipable {
    func swipe(pass: Pass) {
        if let merchDiscount = pass.visitorType.merchDiscount {
            print("Merchandise is discounted at \(merchDiscount)%")
        } else {
            print("No discount")
        }
    }
    
    init(){
        
    }
}

class SecurityReader: Swipable {
    let securityArea: AreaAccess
    func swipe(pass: Pass) {
        if (pass.visitorType.areaAccess.contains(securityArea)){
            print("Access Granted")
        } else {
            print("Access Denied")
        }
    }
    
    init(securityArea: AreaAccess){
       self.securityArea = securityArea
    }
}

