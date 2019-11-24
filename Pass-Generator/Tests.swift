//
//  File.swift
//  Pass-Generator
//
//  Created by Murray Fenstermaker on 11/29/18.
//  Copyright © 2018 Nostalgiabox. All rights reserved.
//

import Foundation

/*class Tests {
    func beginTest(testRun: Int) throws {
        switch testRun{
        case 1:
            print("Testing Classic Guest on their Birthday")
            let date = Date()
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "100 Fake St", city: "Chicago", state: "IL", zip: "2002", dateOfBirth: date)
            let pass = try Pass(visitorType: .classicGuest, personalInfo: personalInfo)
            gauntlet(pass: pass)
        
        case 2:
            print("Testing Free Child Guest")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "bleh", city: "bleh", state: "bleh", zip: "Bleh", dateOfBirth: date)
        let pass = try Pass(visitorType: .freeChildGuest, personalInfo: personalInfo)
        gauntlet(pass: pass)
        case 3:
            print("Testing an Hourly Employee (Food)")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "bleh", city: "bleh", state: "bleh", zip: "Bleh", dateOfBirth: date)
            let pass = try Pass(visitorType: .hourlyEmployeeFood, personalInfo: personalInfo)
            gauntlet(pass: pass)
        case 4:
            print("Testing an Hourly Employee (Maintenance)")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "bleh", city: "bleh", state: "bleh", zip: "Bleh", dateOfBirth: date)
            let pass = try Pass(visitorType: .hourlyEmployeeMaintenance, personalInfo: personalInfo)
            gauntlet(pass: pass)
        case 5:
            print("Testing an Hourly Employee (Ride)")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "bleh", city: "bleh", state: "bleh", zip: "Bleh", dateOfBirth: date)
            let pass = try Pass(visitorType: .hourlyEmployeeRide, personalInfo: personalInfo)
            gauntlet(pass: pass)
        case 6:
            print("Testing a Manager")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "bleh", city: "bleh", state: "bleh", zip: "Bleh", dateOfBirth: date)
            let pass = try Pass(visitorType: .manager, personalInfo: personalInfo)
            gauntlet(pass: pass)
        case 7:
            print("Testing a VIP")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "bleh", city: "bleh", state: "bleh", zip: "Bleh", dateOfBirth: date)
            let pass = try Pass(visitorType: .VIP, personalInfo: personalInfo)
            gauntlet(pass: pass)
        case 8:
            print("Testing a child without a birthday")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "bleh", city: "bleh", state: "bleh", zip: "Bleh", dateOfBirth: nil)
            let pass = try Pass(visitorType: .freeChildGuest, personalInfo: personalInfo)
            gauntlet(pass: pass)
        case 9:
            print("Testing a manager without an address")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: nil, city: nil, state: nil, zip: nil, dateOfBirth: date)
            let pass = try Pass(visitorType: .manager, personalInfo: personalInfo)
            gauntlet(pass: pass)
        case 10:
            print("Testing a food employee without a city")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "bleh", city: nil, state: "bleh", zip: "Bleh", dateOfBirth: date)
            let pass = try Pass(visitorType: .hourlyEmployeeFood, personalInfo: personalInfo)
            gauntlet(pass: pass)
        case 11:
            print("Testing a ride employee without a last name")
            let date = Date().addingTimeInterval(-100000)
            let personalInfo = PersonalInfo(firstName: "Bo", lastName: nil, streetAddress: "bleh", city: "bleh", state: "bleh", zip: "Bleh", dateOfBirth: date)
            let pass = try Pass(visitorType: .hourlyEmployeeRide, personalInfo: personalInfo)
            gauntlet(pass: pass)
        default:
            print("no valid case number added")
        }
       
    }
    
    func gauntlet(pass: Pass){
        let rideReader = RideReader()
        let foodReader = FoodReader()
        let merchReader = MerchReader()
        let amusementReader = SecurityReader(securityArea: .amusement)
        let kitchenReader = SecurityReader(securityArea: .kitchen)
        let maintenanceReader = SecurityReader(securityArea: .maintenance)
        let officeReader = SecurityReader(securityArea: .office)
        let rideControlReader = SecurityReader(securityArea: .rideControl)
        let ReaderArray: [Swipable] = [rideReader, foodReader, merchReader, amusementReader, kitchenReader, maintenanceReader, officeReader, rideControlReader]
        for reader in ReaderArray {
            sleep(6)
            print("Swiping \(pass.personalInfo?.firstName)'s pass in Reader \(reader.name)")
            reader.swipe(pass: pass)
            
        }
    }
}
*/
