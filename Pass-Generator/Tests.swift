//
//  File.swift
//  Pass-Generator
//
//  Created by Murray Fenstermaker on 11/29/18.
//  Copyright © 2018 Nostalgiabox. All rights reserved.
//

import Foundation

class Tests {
    func beginTest() throws {
        print("lets begin");
        let date = Date()
        let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: "bleh", city: "bleh", state: "bleh", zip: "Bleh", dateOfBirth: date)
        var passes: [Pass] = []
        let pass1 = try Pass(visitorType: .classicGuest, personalInfo: personalInfo)
        let pass2 = try Pass(visitorType: .freeChildGuest, personalInfo: personalInfo)
        let pass3 =  try Pass(visitorType: .hourlyEmployeeFood, personalInfo: personalInfo)
        passes.append(pass1);
        passes.append(pass2);
        passes.append(pass3);
        for pass in passes{
            gauntlet(pass: pass)
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
            print("Swiping Reader")
            reader.swipe(pass: pass)
            //sleep(6)
        }
    }
}
