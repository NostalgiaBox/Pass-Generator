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
    func checkBirthday(pass: Pass) -> Bool
}

class RideReader: Swipable {
    func checkBirthday(pass: Pass) -> Bool{
        
        if let personalInfo = pass.personalInfo, let birthday = personalInfo.dateOfBirth {
            let dateFormatter = DateFormatter()
            let date = Date();
            dateFormatter.dateStyle = .full
            
            dateFormatter.timeStyle = .full
            dateFormatter.dateFormat = "MMMM-dd-yyyy"
            let birthdayString = dateFormatter.string(from: birthday)
            let comparisonString = dateFormatter.string(from: date)
            if(birthdayString == comparisonString){
                return true;
            }
            
        }
        return false;
    }
    
    func swipe(pass: Pass) {
        let date = Date();
        if (checkBirthday(pass: pass)){
            print("Happy Birthday")
        }
        if (date.timeIntervalSince(pass.swipeTime) < 5){
            print("Too Soon to Swipe Again")
        }
        else{
            pass.swipeTime = date;
            if (pass.visitorType.rideAccess){
            print("Access Granted to Rides")
        } else {
            print("Access Denied to Rides")
        }
        }
    }
    
    init(){
        
    }
}

class FoodReader: Swipable {
    func swipe(pass: Pass) {
        let date = Date();
        if (checkBirthday(pass: pass)){
            print("Happy Birthday")
        }
        if (date.timeIntervalSince(pass.swipeTime) < 5){
            print("Too Soon to Swipe Again")
        }
        else{
            pass.swipeTime = date;
        if let foodDiscount = pass.visitorType.foodDiscount {
            print("Food is discounted at \(foodDiscount)%")
        } else {
            print("No discount at food stores")
        }
    }
    }
    func checkBirthday(pass: Pass) -> Bool{
        
        if let personalInfo = pass.personalInfo, let birthday = personalInfo.dateOfBirth {
            let dateFormatter = DateFormatter()
            let date = Date();
            dateFormatter.dateStyle = .full
            
            dateFormatter.timeStyle = .full
            dateFormatter.dateFormat = "MMMM-dd-yyyy"
            let birthdayString = dateFormatter.string(from: birthday)
            let comparisonString = dateFormatter.string(from: date)
            if(birthdayString == comparisonString){
                return true;
            }
        
        }
        return false;
    }
    init(){
        
    }
}

class MerchReader: Swipable {
    func swipe(pass: Pass) {
        let date = Date();
        if (checkBirthday(pass: pass)){
            print("Happy Birthday")
        }
        if (date.timeIntervalSince(pass.swipeTime) < 5){
            print("Too Soon to Swipe Again")
        }
        else{
            pass.swipeTime = date;
        if let merchDiscount = pass.visitorType.merchDiscount {
            print("Merchandise is discounted at \(merchDiscount)%")
        } else {
            print("No discount at merch stores")
        }
    }
    }
    func checkBirthday(pass: Pass) -> Bool{
        
        if let personalInfo = pass.personalInfo, let birthday = personalInfo.dateOfBirth {
            let dateFormatter = DateFormatter()
            let date = Date();
            dateFormatter.dateStyle = .full
            
            dateFormatter.timeStyle = .full
            dateFormatter.dateFormat = "MMMM-dd-yyyy"
            let birthdayString = dateFormatter.string(from: birthday)
            let comparisonString = dateFormatter.string(from: date)
            if(birthdayString == comparisonString){
                return true;
            }
            
        }
        return false;
    }
    init(){
        
    }
}

class SecurityReader: Swipable {
    let securityArea: AreaAccess
    func swipe(pass: Pass) {
        let date = Date();
        if (checkBirthday(pass: pass)){
            print("Happy Birthday")
        }
        if (date.timeIntervalSince(pass.swipeTime) < 5){
            print("Too Soon to Swipe Again")
        }
        else{
            pass.swipeTime = date;
        if (pass.visitorType.areaAccess.contains(securityArea)){
            print("Access Granted to \(securityArea)")
        } else {
            print("Access Denied to \(securityArea)")
        }
    }
    }
    func checkBirthday(pass: Pass) -> Bool{
        
        if let personalInfo = pass.personalInfo, let birthday = personalInfo.dateOfBirth {
            let dateFormatter = DateFormatter()
            let date = Date();
            dateFormatter.dateStyle = .full
            
            dateFormatter.timeStyle = .full
            dateFormatter.dateFormat = "MMMM-dd-yyyy"
            let birthdayString = dateFormatter.string(from: birthday)
            let comparisonString = dateFormatter.string(from: date)
            if(birthdayString == comparisonString){
                return true;
            }
            
        }
        return false;
    }
    init(securityArea: AreaAccess){
       self.securityArea = securityArea
    }
}

