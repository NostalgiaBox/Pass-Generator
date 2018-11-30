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
        var tests = Tests()
        
        do{
            try tests.beginTest()
            
        
        }catch PassError.cityMissing {
            print("City is missing");
        }catch PassError.dateOfBirthMissing {
            print("DoB is missing");
        }catch PassError.personalInfoMissing {
            print("Personal Info is missing");
        }catch PassError.stateMissing {
            print("State is missing");
        }catch PassError.streetAddressMissing {
            print("Street is missing");
        }catch PassError.zipMissing {
            print("Zip is missing");
        }catch {
            print("Unhandled Error");
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

