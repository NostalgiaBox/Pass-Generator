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
    var pass: Pass? = nil
   // var nameAndAddressArray: [UITextField] = []
    var nameAndBirthdayArray: [UITextField] = []
    var vendorArray: [UITextField] = []
    var optionButtonDestinations: [fieldSelection] = [.nothing, .nothing, .nothing, .nothing, .nothing]
    var optionButtonVisitorType: [VisitorType] = [.classicGuest, .VIP, .freeChildGuest, .seasonPassGuest, .seniorGuest]
    var selectedVisitorType: VisitorType = .classicGuest
    var currentActiveTextFields: [UITextField] = []
    var sampleData: [VisitorType : [UITextField : String]] = Dictionary<VisitorType, Dictionary<UITextField, String>>()
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
    var optionButtons: [UIButton] = []
    @IBAction func pushOption1(_ sender: Any) {
        selectedVisitorType = (optionButtonVisitorType[0])
        setFields(optionButtonDestinations[0])
    }
    @IBAction func pushOption2(_ sender: Any) {
        selectedVisitorType = (optionButtonVisitorType[1])
        setFields(optionButtonDestinations[1])
    }
    @IBAction func pushOption3(_ sender: Any) {
        selectedVisitorType = (optionButtonVisitorType[2])
        setFields(optionButtonDestinations[2])
    }
    @IBAction func pushOption4(_ sender: Any) {
        selectedVisitorType = (optionButtonVisitorType[3])
        print(optionButtonDestinations[3])
        setFields(optionButtonDestinations[3])
    }
    @IBAction func pushOption5(_ sender: Any) {
        selectedVisitorType = (optionButtonVisitorType[4])
        setFields(optionButtonDestinations[4])
    }
    @IBAction func GeneratePass(_ sender: Any) {
        
        let personalInfo = generatePersonalInfo()
        do {
            pass = try Pass(visitorType: selectedVisitorType, personalInfo: personalInfo)
            print("Passed!")
            performSegue(withIdentifier: "MySegue", sender: nil)
        } catch {
            highlightNilFields(currentActiveTextFields)
            print("Error")
        }
        
    }
    @IBAction func PopulateData(_ sender: Any) {
        populateData()
    }
    @IBAction func pushGuest(_ sender: Any) {
        optionButtonVisitorType = [.classicGuest, .VIP, .freeChildGuest, .seasonPassGuest, .seniorGuest]
        setMenu(.guest)
    }
    @IBAction func pushEmployee(_ sender: Any) {
        optionButtonVisitorType = [.hourlyEmployeeFood, .hourlyEmployeeRide, .hourlyEmployeeMaintenance, .contractEmployee]
        setMenu(.employee)
    }
    @IBAction func pushManager(_ sender: Any) {
        selectedVisitorType = .manager
        setMenu(.manager)
    }
    @IBAction func pushVendor(_ sender: Any) {
        selectedVisitorType = .vendor
        setMenu(.vendor)
    }
    
    func populateData(){
    
        for (key, value) in sampleData[selectedVisitorType]! {
            key.text = value
        }
    }
    
    func highlightNilFields(_ fields: [UITextField]){
        for field in fields {
            if !field.hasText {
                highlightField(field)
            }else {
                unhighlightField(field)
            }
        }
    }
    
    func highlightField(_ field: UITextField) {
        field.backgroundColor = UIColor.systemPink
    }
    
    func unhighlightField(_ field: UITextField) {
        field.backgroundColor = UIColor.white
    }
    
    func generatePersonalInfo() -> PersonalInfo {
        let contract: Contract? = checkContract(ProjectField.text)
        let company: Company? = checkCompany(CompanyField.text)
        let date = Date()
        
        let personalInfo = PersonalInfo(firstName: checkEmpty(FirstNameField), lastName: checkEmpty(LastNameField), streetAddress: checkEmpty(StreetField), city: checkEmpty(CityField), state: checkEmpty(StateField), zip: checkEmpty(ZipField), dateOfBirth: checkDateEmpty(DOBField), company: company, dateOfVisit: date, contractNumber: contract)
        print("Date of visit \(date)")
        return personalInfo
    }
    
    func checkEmpty(_ input: UITextField) -> String? {
        if !(input.hasText) {
            return nil
        } else {
            return input.text
        }
    }
    
    func checkDateEmpty(_ input: UITextField) -> Date? {
        if !(input.hasText) {
            return nil
        } else {
            let dateFormatter = DateFormatter()
            print(input.text)
            dateFormatter.dateFormat = "MMM dd,yyyy"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            let date = dateFormatter.date(from: input.text!)
            print(date)
            return date
        }
    }
    
    
    lazy var datePicker: UIDatePicker = {
          
          let picker = UIDatePicker()
          
          picker.datePickerMode = .date
          
          picker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
          
          return picker
      }()
    lazy var dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        
        formatter.timeStyle = .none
        
        return formatter
    }()
    
    func checkContract(_ contract: String?) -> Contract? {
        if let contract = contract {
            switch contract {
            case "1001":
                return .number1001
                ProjectField.backgroundColor = UIColor.white
            case "1002":
                return .number1002
                ProjectField.backgroundColor = UIColor.white
            case "1003":
                return .number1003
                ProjectField.backgroundColor = UIColor.white
            case "2001":
                return .number2001
                ProjectField.backgroundColor = UIColor.white
            case "2002":
                return .number2002
                ProjectField.backgroundColor = UIColor.white
            default:
                ProjectField.text = nil
                return nil
            }
        } else {
            return nil
        }
    }
    
    func checkCompany(_ company: String?) -> Company? {
        if var company = company {
            company = company.lowercased()
            company = String(company.filter { !" \n\t\r".contains($0) })
            
            switch company {
            case "orkin":
                return .orkin
                CompanyField.backgroundColor = UIColor.white
            case "acme":
                return .acme
                CompanyField.backgroundColor = UIColor.white
            case "fedex":
                return .fedex
                CompanyField.backgroundColor = UIColor.white
            case "nwelectrical":
                return .NWElectrical
                CompanyField.backgroundColor = UIColor.white
            default:
                CompanyField.text = nil
                return nil
            }
        } else {
            return nil
        }
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
                optionButtonDestinations = [.nameAndAddress, .nameAndAddress, .nameAndAddress, .contract, .nothing]
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
            currentActiveTextFields = [FirstNameField, LastNameField, StreetField,  CityField, StateField, ZipField]
            showHideFields(currentActiveTextFields)
        case .nothing:
            currentActiveTextFields = []
        case .contract:
            print("Contract Baybeee")
            currentActiveTextFields = [FirstNameField, LastNameField, StreetField,  CityField, StateField, ZipField, ProjectField]
            showHideFields(currentActiveTextFields)
        case .birthdayOnly:
            currentActiveTextFields = [DOBField]
            
        case .nameAndBirthday:
            currentActiveTextFields = nameAndBirthdayArray
        case .vendor:
            currentActiveTextFields = vendorArray
           
        }
        showHideFields(currentActiveTextFields)
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
        button.setTitle(label, for: .normal)
        subMenuView.isHidden = false
        button.isHidden = false
        
        
    }
    
    func hideButton(_ button: UIButton){
        button.isHidden = true
    }
    
    func hideAllButtons() {
        for button in optionButtons {
            hideButton(button)
        }
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
        case contract
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PassViewController
        {
            let vc = segue.destination as? PassViewController
            vc?.pass = pass
        }
    }
    @objc func datePickerChanged(_ sender: UIDatePicker) {
        
        DOBField.text = dateFormatter.string(from: sender.date)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           
           view.endEditing(true)
    }
    override func viewDidLoad() {
        
        
        fullArray = [FirstNameField, LastNameField, StreetField,  CityField, StateField, ZipField, CompanyField, DOBField, ProjectField]
     //   nameAndAddressArray = [FirstNameField, LastNameField, StreetField,  CityField, StateField, ZipField]
       // contractArray
        nameAndBirthdayArray = [FirstNameField, LastNameField, DOBField]
        vendorArray = [FirstNameField, LastNameField, CompanyField, DOBField]
        optionButtons = [Option1Button, Option2Button, Option3Button, Option4Button, Option5Button]
        setFields(.nothing)
        hideAllButtons()
        super.viewDidLoad()
        DOBField.inputView = datePicker
        let nameAndAddressDict: [UITextField: String] = [FirstNameField: "John",
                            LastNameField: "Smith",
                            StreetField: "123 Easy St",
                            CityField: "Springfield",
                            StateField: "IL",
        ZipField: "21212"]
        sampleData = [.classicGuest: [:],
                      .VIP: [:],
                      .freeChildGuest: [DOBField: "Oct 20, 2010"],
                      .hourlyEmployeeFood: nameAndAddressDict,
                      .hourlyEmployeeRide: nameAndAddressDict,
                      .hourlyEmployeeMaintenance: nameAndAddressDict,
                      .manager: nameAndAddressDict,
                      .seasonPassGuest: nameAndAddressDict,
                      .seniorGuest: [FirstNameField: "Old",
                                     LastNameField: "Man",
                                     DOBField: "Jan 01, 1900"],
                      .contractEmployee: [FirstNameField: "John",
                                          LastNameField: "Smith",
                                          StreetField: "123 Easy St",
                                          CityField: "Springfield",
                                          StateField: "IL",
                                          ZipField: "21212", ProjectField: "1001"],
                        .vendor: [FirstNameField: "John",
                                  LastNameField: "Smith",
                                  CompanyField: "orkin",
                                  DOBField: "Jan 02, 2004"]]
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

