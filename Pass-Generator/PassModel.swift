//
//  EmployeeModel.swift
//  Pass-Generator
//
//  Created by Murray Fenstermaker on 3/26/18.
//  Copyright © 2018 Nostalgiabox. All rights reserved.
//

import Foundation



class Pass {
    var visitorType: VisitorType
    var personalInfo: PersonalInfo?
    var swipeTime: Date
    
    init(visitorType: VisitorType, personalInfo: PersonalInfo) throws{
        self.swipeTime = Date()
        self.visitorType = visitorType
        if(!verifyInfo(personalInfo: personalInfo, visitorType: visitorType)){
            print("THROW!")
            throw PassError.personalInfoMissing
        }
        print("NO THROW")
        self.personalInfo = personalInfo
    }
    
    func verifyInfo(personalInfo: PersonalInfo?, visitorType: VisitorType) -> Bool{
        switch visitorType{
        case .classicGuest, .VIP:
            return true
        case .freeChildGuest:
            if let personalInfo = personalInfo, let _ = personalInfo.dateOfBirth{
                return true;
            } else {
                return false;
            }
        case .hourlyEmployeeFood, .hourlyEmployeeRide, .hourlyEmployeeMaintenance, .manager, .seasonPassGuest:
            if let personalInfo = personalInfo, let _ = personalInfo.firstName, let _ = personalInfo.lastName, let _ = personalInfo.streetAddress, let _ = personalInfo.city, let _ = personalInfo.state, let _ = personalInfo.zip{
                return true
            } else {
                return false
            }
        case .seniorGuest:
            if let personalInfo = personalInfo, let _ = personalInfo.firstName, let _ = personalInfo.lastName, let _ = personalInfo.dateOfBirth {
                return true
            } else {
                return false
            }
        case .vendor:
            if let personalInfo = personalInfo, let _ = personalInfo.firstName, let _ = personalInfo.lastName, let _ = personalInfo.streetAddress, let _ = personalInfo.city, let _ = personalInfo.state, let _ = personalInfo.zip, var _ = personalInfo.company{
                    return true
            } else {
                return false
            }
            
        case .contractEmployee:
            if let personalInfo = personalInfo, let _ = personalInfo.firstName, let _ = personalInfo.lastName, let _ = personalInfo.streetAddress, let _ = personalInfo.city, let _ = personalInfo.state, let _ = personalInfo.zip, let _ = personalInfo.contractNumber{
                 return true
            } else {
                return false
            }
            
        }
    }
}

enum PassError: Error {
    case personalInfoMissing
    case dateOfBirthMissing
    case cityMissing
    case stateMissing
    case zipMissing
    case streetAddressMissing
    case companyMissing
    case dateOfVisitMissing
    case contractMissing
}

enum Contract {
    case number1001
    case number1002
    case number1003
    case number2001
    case number2002
    
    var areaAccess: [AreaAccess]{
        switch self{
        case .number1001:
            return [.rideControl, .amusement]
        case .number1002:
            return [.rideControl, .amusement, .maintenance]
        case .number1003:
            return [.amusement, .kitchen,.rideControl,.maintenance, .office]
        case .number2001:
            return [.office]
        case .number2002:
            return [.kitchen, .maintenance, .office]
        }
    }
}

enum Company {
    case orkin
    case acme
    case fedex
    case NWElectrical
    
    var areaAccess: [AreaAccess]{
        switch self{
        case .acme:
            return [.kitchen]
        case .orkin:
            return [.kitchen, .rideControl, .amusement]
        case .fedex:
            return [.office,.maintenance]
        case .NWElectrical:
            return [.amusement,.kitchen,.rideControl,.maintenance,.office]
        }
    }
}

struct PersonalInfo {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zip: String?
    var dateOfBirth: Date?
    var company: Company?
    var dateOfVisit: Date?
    var contractNumber: Contract?
    
    init(firstName: String?, lastName: String?, streetAddress: String?,
         city: String?, state: String?, zip: String?, dateOfBirth: Date?,
         company: Company?, dateOfVisit: Date?, contractNumber: Contract?){
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zip = zip
        self.dateOfBirth = dateOfBirth
        self.dateOfVisit = dateOfVisit
        self.company = company
        self.contractNumber = contractNumber
    }
}
enum AreaAccess {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
    
}

enum VisitorType {
    case classicGuest
    case VIP
    case freeChildGuest
    case hourlyEmployeeFood
    case hourlyEmployeeRide
    case hourlyEmployeeMaintenance
    case manager
    case seasonPassGuest
    case seniorGuest
    case contractEmployee
    case vendor
}

extension VisitorType{
    var rideAccess: Bool {
        switch self {
        default:
            return true
        }
    }
    var skipLines: Bool {
        switch self {
        case .VIP:
            return true
        default:
            return false
        }
    }
    var foodDiscount: Int?{
        switch self {
        case .VIP, .seasonPassGuest, .seniorGuest:
            return 10
        case .hourlyEmployeeFood, .hourlyEmployeeRide, .hourlyEmployeeMaintenance:
            return 15
        case .manager:
            return 25
        default:
            return nil
    }
    }
    
    var merchDiscount: Int? {
        switch self {
        case .seniorGuest:
            return 10;
        case .VIP, .seasonPassGuest:
            return 20;
    case.hourlyEmployeeFood, .hourlyEmployeeRide, .hourlyEmployeeMaintenance, .manager:
            return 25;
        default:
            return nil
        }
    }
    var areaAccess: [AreaAccess]{
        switch self{
        case .hourlyEmployeeFood, .vendor, .contractEmployee:
            return [.kitchen, .amusement]
        case .hourlyEmployeeRide:
            return [.rideControl, .amusement]
        case .hourlyEmployeeMaintenance:
            return [.amusement, .kitchen,.rideControl,.maintenance]
        case .manager:
            return [.amusement,.kitchen,.rideControl,.maintenance,.office]
        case .freeChildGuest:
            return [.amusement]
        default:
            return []
        }
    }
}
