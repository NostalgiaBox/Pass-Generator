//
//  ViewController.swift
//  Pass-Generator
//
//  Created by Murray Fenstermaker on 3/26/18.
//  Copyright © 2018 Nostalgiabox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var fullArray: [UITextField] = []
   // var nameAndAddressArray: [UITextField] = []
    var nameAndBirthdayArray: [UITextField] = []
    var vendorArray: [UITextField] = []
    var optionButtonDestinations: [fieldSelection] = [.nothing, .nothing, .nothing, .nothing, .nothing]
    @IBOutlet weak var DOBField: UITextField!
    @IBOutlet weak var SSNField: UITextField!
    @IBOutlet weak var ProjectField: UITextField!
    @IBOutlet weak var FirstNameField: UITextField!
    @IBOutlet weak var LastNameField: UITextField!
    @IBOutlet weak var CompanyField: UITextField!
    @IBOutlet weak var StreetField: UITextField!
    @IBOutlet weak var CityField: UITextField!
    @IBOutlet weak var StateField: UITextField!
    @IBOutlet weak var ZipField: UITextField!
    @IBOutlet weak var subMenuView: UIView!
    @IBOutlet weak var Option1Button: UIButton!
    @IBOutlet weak var Option2Button: UIButton!
    @IBOutlet weak var Option3Button: UIButton!
    @IBOutlet weak var Option4Button: UIButton!
    @IBOutlet weak var Option5Button: UIButton!
    
    @IBAction func pushOption1(_ sender: Any) {
        setFields(optionButtonDestinations[0])
    }
    @IBAction func pushOption2(_ sender: Any) {
        setFields(optionButtonDestinations[1])
    }
    @IBAction func pushOption3(_ sender: Any) {
        setFields(optionButtonDestinations[2])
    }
    @IBAction func pushOption4(_ sender: Any) {
        setFields(optionButtonDestinations[3])
    }
    @IBAction func pushOption5(_ sender: Any) {
        setFields(optionButtonDestinations[4])
    }
    @IBAction func GeneratePass(_ sender: Any) {
        
        DOBField.text = ""
        DOBField.isUserInteractionEnabled = false
        DOBField.backgroundColor = UIColor.darkGray
    }
    @IBAction func PopulateData(_ sender: Any) {
        DOBField.text = "ACTIVE"
        DOBField.isUserInteractionEnabled = true
        DOBField.backgroundColor = UIColor.white
    }
    @IBAction func pushGuest(_ sender: Any) {
        setMenu(.guest)
    }
    @IBAction func pushEmployee(_ sender: Any) {
        setMenu(.employee)
    }
    @IBAction func pushManager(_ sender: Any) {
        setMenu(.manager)
    }
    @IBAction func pushVendor(_ sender: Any) {
        setMenu(.vendor)
    }
    
    func setMenu(_ selection: menuSelection){
        switch selection{
            case .guest:
                optionButtonDestinations = [.nothing, .nothing, .birthdayOnly, .nameAndAddress, .nameAndBirthday]
                showButton(Option1Button, label: "Classic Guest")
                showButton(Option2Button, label: "VIP Guest")
                showButton(Option3Button, label: "Free Child Guest")
                showButton(Option4Button, label: "Season Pass Guest")
                showButton(Option5Button, label: "Senior Guest")
            case .employee:
                optionButtonDestinations = [.nameAndAddress, .nameAndAddress, .nameAndAddress, .nameAndAddress, .nameAndAddress, .nothing]
                showButton(Option1Button, label: "Food Services")
                showButton(Option2Button,
                    label: "Ride Services")
                showButton(Option3Button, label: "Maintenance")
                showButton(Option4Button, label: "Contract")
                hideButton(Option5Button)
            case .manager:
                hideAllButtons()
                setFields(.nameAndAddress)
            case .vendor:
                hideAllButtons()
                setFields(.vendor)
        }
        
    }
    
    func setFields(_ selection: fieldSelection){
        hideAndClear()
        switch selection{
        case .nameAndAddress:
            showHideFields([FirstNameField, LastNameField, StreetField,  CityField, StateField, ZipField])
        case .nothing:
            print("nothing")
        case .birthdayOnly:
            showHideFields([DOBField])
        case .nameAndBirthday:
            showHideFields(nameAndBirthdayArray)
        case .vendor:
           showHideFields(vendorArray)
        }
        
    }
    
    func hideAndClear(){
        for field in fullArray{
            field.text = ""
            field.isEnabled = false
            field.backgroundColor = UIColor.darkGray
        }
    }
    
    func showHideFields(_ array: [UITextField]){
        for field in array{
            field.isEnabled = true
            field.backgroundColor = UIColor.white
        }
        
    }
    func showButton(_ button: UIButton, label: String){
        subMenuView.isHidden = false
        button.isHidden = false
        button.setTitle(label, for: .normal)
        
    }
    
    func hideButton(_ button: UIButton){
        button.isHidden = true
    }
    
    func hideAllButtons() {
        subMenuView.isHidden = true
    }
    
    enum menuSelection {
        case guest
        case employee
        case manager
        case vendor
       
    }
    
    enum fieldSelection {
        case nameAndAddress
        case nothing
        case birthdayOnly
        case nameAndBirthday
        case vendor
    }
    override func viewDidLoad() {
        fullArray = [FirstNameField, LastNameField, StreetField,  CityField, StateField, ZipField, CompanyField, DOBField]
      //  nameAndAddressArray = [FirstNameField, LastNameField, StreetField,  CityField, StateField, ZipField]
        nameAndBirthdayArray = [FirstNameField, LastNameField, DOBField]
        vendorArray = [FirstNameField, LastNameField, CompanyField, DOBField]
        super.viewDidLoad()
       /* var tests = Tests()
        for i in 1...11{
        do{
            print("Beginning Test #\(i)")
            try tests.beginTest(testRun: i)
            print("\n\n")
            
        
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
        }*/
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

