//
//  ViewController.swift
//  Pass-Generator
//
//  Created by Murray Fenstermaker on 3/26/18.
//  Copyright © 2018 Nostalgiabox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let personalInfo = PersonalInfo(firstName: "Bo", lastName: "Duke", streetAddress: nil, city: nil, state: nil, zip: nil, dateOfBirth: nil)
        do{let pass: Pass = try Pass(visitorType: .classicGuest, personalInfo: personalInfo)
            gauntlet(pass: pass)
        }
        catch{}
        
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
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

