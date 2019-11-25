//
//  ReaderModel.swift
//  Pass-Generator
//
//  Created by Murray Fenstermaker on 7/10/18.
//  Copyright © 2018 Nostalgiabox. All rights reserved.
//

import Foundation

protocol Swipable {
    var name: String {get}
    func swipe(pass: Pass) -> (Bool, String)
    func checkBirthday(pass: Pass) -> Bool
}


class RideReader: Swipable {
    var name = "Ride Reader"
    func checkBirthday(pass: Pass) -> Bool{
        
        if let personalInfo = pass.personalInfo, let birthday = personalInfo.dateOfBirth {
            let dateFormatter = DateFormatter()
            let date = Date();
            dateFormatter.dateStyle = .full
            
            dateFormatter.timeStyle = .full
            dateFormatter.dateFormat = "MMM dd"
            let birthdayString = dateFormatter.string(from: birthday)
            let comparisonString = dateFormatter.string(from: date)
            if(birthdayString == comparisonString){
                return true;
            }
            
        }
        return false;
    }
    
    func swipe(pass: Pass) -> (Bool, String){
        let date = Date();
        var access = false
        var outputResult = ""
        if (checkBirthday(pass: pass)){
            outputResult = "Happy Birthday\n"
        }
        if (date.timeIntervalSince(pass.swipeTime) < 5){
            outputResult = outputResult + "Too Soon to Swipe Again"
        }
        else{
            pass.swipeTime = date;
            if (pass.visitorType.rideAccess){
                if (pass.visitorType.skipLines){
                    
                    outputResult = outputResult + "Go to the front of the line\n"
                }
            access = true
            outputResult = outputResult + "Access Granted to Rides"
        } else {
            access = false
            outputResult = outputResult + "Access Denied to Rides"
        }
        }
        return (access, outputResult)
    }
    
    init(){
        
    }
}

class FoodReader: Swipable {
    var name = "Food Reader"
    func swipe(pass: Pass) -> (Bool, String){
        let date = Date();
        var access = false
        var outputResult = ""
        if (checkBirthday(pass: pass)){
            outputResult = "Happy Birthday\n"
        }
        if (date.timeIntervalSince(pass.swipeTime) < 5){
            outputResult = outputResult + "Too Soon to Swipe Again\n"
        }
        else{
            pass.swipeTime = date;
        if let foodDiscount = pass.visitorType.foodDiscount {
            outputResult = outputResult + "Food is discounted at \(foodDiscount)%"
            access = true
        } else {
            outputResult = outputResult + "No discount at food stores"
            access = true
        }
    }
        return (access, outputResult)
    }
    func checkBirthday(pass: Pass) -> Bool{
        
        if let personalInfo = pass.personalInfo, let birthday = personalInfo.dateOfBirth {
            let dateFormatter = DateFormatter()
            let date = Date();
            dateFormatter.dateStyle = .full
            
            dateFormatter.timeStyle = .full
            dateFormatter.dateFormat = "MMM dd"
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
    var name = "Merch Reader"
    func swipe(pass: Pass) -> (Bool, String){
        let date = Date();
        var outputResult = ""
        var access = false
        if (checkBirthday(pass: pass)){
            outputResult = "Happy Birthday\n"
        }
        if (date.timeIntervalSince(pass.swipeTime) < 5){
            outputResult = outputResult + "Too Soon to Swipe Again\n"
        }
        else{
            pass.swipeTime = date;
        if let merchDiscount = pass.visitorType.merchDiscount {
            outputResult = outputResult + "Merchandise is discounted at \(merchDiscount)%"
            access = true
        } else {
            outputResult = outputResult + "No discount at merch stores"
            access = true
        }
    }
        return (access, outputResult)
    }
    func checkBirthday(pass: Pass) -> Bool{
        
        if let personalInfo = pass.personalInfo, let birthday = personalInfo.dateOfBirth {
            let dateFormatter = DateFormatter()
            let date = Date();
            dateFormatter.dateStyle = .full
            
            dateFormatter.timeStyle = .full
            dateFormatter.dateFormat = "MMM dd"
            let birthdayString = dateFormatter.string(from: birthday)
            let comparisonString = dateFormatter.string(from: date)
            print("\(birthdayString) birthday \(comparisonString) comparison")
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
    var name = "Security Reader"
    let securityArea: AreaAccess
    func swipe(pass: Pass) -> (Bool, String) {
        let date = Date();
        var outputResult = ""
        var access = false
        if (checkBirthday(pass: pass)){
            outputResult = "Happy Birthday\n"
        }
        if (date.timeIntervalSince(pass.swipeTime) < 5){
            outputResult = outputResult + "Too Soon to Swipe Again"
            access = false
        }
        else{
            pass.swipeTime = date;
            if (pass.visitorType == .vendor){
                if (pass.personalInfo!.company!.areaAccess.contains(securityArea)){
                    access = true
                    outputResult = outputResult + "Access Granted for \(securityArea)"
                }else {
                    access = false
                    outputResult = outputResult + "Access Denied to \(securityArea)"
                }
            }else if (pass.visitorType == .contractEmployee){
                if (pass.personalInfo!.contractNumber!.areaAccess.contains(securityArea)){
                    access = true
                    outputResult = outputResult + "Access Granted to \(securityArea)"
                }else {
                    access = false
                    outputResult = outputResult + "Access Denied to \(securityArea)"
                }
            } else
            if (pass.visitorType.areaAccess.contains(securityArea)){
            access = true
            outputResult = outputResult + "Access Granted to \(securityArea)"
        } else {
            access = false
            outputResult = outputResult + "Access Denied to \(securityArea)"
        }
        
        
    }
        return (access, outputResult)
    }
    
    
    
    func checkBirthday(pass: Pass) -> Bool{
        
        if let personalInfo = pass.personalInfo, let birthday = personalInfo.dateOfBirth {
            let dateFormatter = DateFormatter()
            let date = Date();
            dateFormatter.dateStyle = .full
            
            dateFormatter.timeStyle = .full
            dateFormatter.dateFormat = "MMM dd"
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

