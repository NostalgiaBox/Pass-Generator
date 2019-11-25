//
//  PassViewController.swift
//  Pass-Generator
//
//  Created by Murray Fenstermaker on 11/23/19.
//  Copyright © 2019 Nostalgiabox. All rights reserved.
//

import UIKit
import AVFoundation

class PassViewController: UIViewController {

    var pass: Pass? = nil
    var audioPlayer = AVAudioPlayer()
    @IBOutlet weak var GuestName: UILabel!
    @IBOutlet weak var GuestType: UILabel!
    @IBOutlet weak var Discounts: UILabel!
    @IBOutlet weak var ResultView: UIView!
    @IBOutlet weak var ResultText: UILabel!
    @IBAction func pushOffice(_ sender: Any) {
        verifyAccess(.office)
    }
    @IBAction func pushKitchen(_ sender: Any) {
        verifyAccess(.kitchen)
    }
    @IBAction func pushRideControl(_ sender: Any) {
        verifyAccess(.rideControl)
    }
    @IBAction func pushAmusement(_ sender: Any) {
        verifyAccess(.amusement)
    }
    @IBAction func pushRides(_ sender: Any) {
        let reader = RideReader()
        verifyAccess(reader)
    }
    @IBAction func pushFood(_ sender: Any) {
        let reader = FoodReader()
        verifyAccess(reader)
    }
    @IBAction func pushMerchandise(_ sender: Any) {
        let reader = MerchReader()
        verifyAccess(reader)
    }
    @IBAction func pushMaintenance(_ sender: Any) {
        verifyAccess(.maintenance)
    }
    @IBAction func leavePass(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeCard()
    }
    
    func verifyAccess(_ reader: Swipable){
        if let pass = pass {
           // let reader = SecurityReader(securityArea: readerType)
            let result = reader.swipe(pass: pass)
            if !result.0 {
                deny(result.1)
            } else {
                allow(result.1)
            }
        }
    }
    func verifyAccess(_ readerType: AreaAccess){
        if let pass = pass {
            let reader = SecurityReader(securityArea: readerType)
            let result = reader.swipe(pass: pass)
            if !result.0 {
                deny(result.1)
            } else {
                allow(result.1)
            }
        }
    }
    func allow(_ text: String){
        ResultView.backgroundColor = UIColor.green
        ResultText.text = text
        playSwipeResult(pass: true)
    }
    func deny(_ text: String){
        ResultView.backgroundColor = UIColor.red
        ResultText.text = text
        playSwipeResult(pass: false)
    }
    
    func playSwipeResult(pass: Bool){
        var sound: String?
        if pass {
            sound = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        }else {
            sound = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        }
        do { audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            audioPlayer.play()
        }
        catch {}
    }
    
    func initializeCard(){
        setNameLabel()
        GuestType.text = pass?.visitorType.label
        setDiscountLabel()
    }

    func setDiscountLabel(){
        var firstLine = ""
        var secondLine = ""
        var thirdLine = ""
        if let currentPass = pass {
            if currentPass.visitorType.skipLines {
                firstLine = "- Unlimited Rides with no lines"
            } else if currentPass.visitorType.rideAccess {
                firstLine = "- Unlimited Rides"
            } else {
                firstLine = "- No access to rides"
            }
            if let foodDiscount = currentPass.visitorType.foodDiscount {
                secondLine = "- \(foodDiscount)% off Food"
            } else {
                secondLine = "- No food discount"
            }
            if let merchDiscount = currentPass.visitorType.merchDiscount {
                thirdLine = "- \(merchDiscount)% off Merch"
            } else {
                thirdLine = "- No merch discount"
            }
            Discounts.text = "\(firstLine) \n\(secondLine)\n\(thirdLine)"
        }else {
        Discounts.text = ""
        }
    }

    func setNameLabel(){
        var fullName = ""
        if let firstName = pass?.personalInfo?.firstName {
            if let lastname = pass?.personalInfo?.lastName {
                fullName = firstName + " " + lastname
            } else {
                fullName = firstName
            }
        }else if let lastname = pass?.personalInfo?.lastName {
            fullName = lastname
        }
        GuestName.text = fullName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
