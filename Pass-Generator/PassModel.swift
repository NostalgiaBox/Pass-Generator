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
    
    init(visitorType: VisitorType, personalInfo: PersonalInfo) throws{
        self.visitorType = visitorType
        if(!verifyInfo(personalInfo: personalInfo, visitorType: visitorType)){
            throw PassError.personalInfoMissing
        }
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
        case .hourlyEmployeeFood, .hourlyEmployeeRide, .hourlyEmployeeMaintenance, .manager:
            if let personalInfo = personalInfo, let _ = personalInfo.firstName, let _ = personalInfo.lastName, let _ = personalInfo.streetAddress, let _ = personalInfo.state, let _ = personalInfo.zip{
                return true
            } else {
                return false
            }
        }
    }
}

enum PassError: Error {
    case personalInfoMissing
}

struct PersonalInfo {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zip: String?
    var dateOfBirth: Date?
    
    init(firstName: String?, lastName: String?, streetAddress: String?,
         city: String?, state: String?, zip: String?, dateOfBirth: Date?){
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zip = zip
        self.dateOfBirth = dateOfBirth
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
    case .VIP:
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
        case .VIP:
            return 20;
    case.hourlyEmployeeFood, .hourlyEmployeeRide, .hourlyEmployeeMaintenance, .manager:
            return 25;
        default:
            return nil
        }
    }
    var areaAccess: [AreaAccess]{
        switch self{
        case .hourlyEmployeeFood:
            return [.kitchen, .amusement]
        case .hourlyEmployeeRide:
            return [.rideControl, .amusement]
        case .hourlyEmployeeMaintenance:
            return [.amusement, .kitchen,.rideControl,.maintenance]
        case .manager:
            return [.amusement,.kitchen,.rideControl,.maintenance,.office]
        default:
            return [.amusement]
        }
    }
}
