//
//  PinController.swift
//  vonder-app
//
//  Created by golf on 7/6/2564 BE.
//

import UIKit
import OTPFieldView

class PinController : UIViewController, OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
           print("Has entered all OTP? \(hasEntered)")
           return false
       }
       
       func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
           return true
       }
       
       func enteredOTP(otp otpString: String) {
           print("OTPString: \(otpString)")
       }
    
    
    @IBOutlet weak var img_signin: UIImageView!
    @IBOutlet weak var view_signin: UIView!
    @IBOutlet weak var btn_signin: UIButton!
    @IBOutlet weak var view_pin: OTPFieldView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        view_signin.layer.cornerRadius = 10.0
        img_signin.layer.cornerRadius = 10.0
        
        self.btn_signin.isEnabled = false
        self.btn_signin.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
        self.btn_signin.setTitleColor(UIColor(red: 158/255.0, green: 160/255.0, blue: 172/255.0, alpha: 1), for: .normal)
        self.btn_signin.borderColor =  UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
        setupOtpView()
      
    }
    
    
    func setupOtpView(){
            self.view_pin.fieldsCount = 6
            self.view_pin.fieldBorderWidth = 2
            self.view_pin.defaultBorderColor =  UIColor(red: 110/255.0, green: 114/255.0, blue: 130/255.0, alpha: 1)
            self.view_pin.filledBorderColor =  UIColor(red: 110/255.0, green: 114/255.0, blue: 130/255.0, alpha: 1)
            self.view_pin.cursorColor = UIColor.black
            self.view_pin.displayType = .roundedCorner
            self.view_pin.fieldSize = 46
            self.view_pin.separatorSpace = 6
            self.view_pin.shouldAllowIntermediateEditing = false
            self.view_pin.delegate = self
            self.view_pin.initializeUI()
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
