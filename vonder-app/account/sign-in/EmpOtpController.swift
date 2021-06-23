//
//  EmpOtpController.swift
//  vonder-app
//
//  Created by golf on 8/6/2564 BE.
//

import UIKit
import OTPFieldView

class EmpOtpController : UIViewController, OTPFieldViewDelegate {
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
    @IBOutlet weak var view_otp: OTPFieldView!
    @IBOutlet weak var btn_request: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        view_signin.layer.cornerRadius = 10.0
        img_signin.layer.cornerRadius = 10.0
        
        self.btn_signin.isEnabled = false
        self.btn_signin.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
        self.btn_signin.setTitleColor(UIColor(red: 158/255.0, green: 160/255.0, blue: 172/255.0, alpha: 1), for: .normal)
        self.btn_signin.borderColor =  UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
        
        
        self.btn_request.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        self.btn_request.setTitleColor(UIColor(red: 158/255.0, green: 160/255.0, blue: 172/255.0, alpha: 1), for: .normal)
        self.btn_request.borderColor =  UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
        setupOtpView()
      
    }
    
    func setupOtpView(){
        self.view_otp.fieldsCount = 6
        self.view_otp.fieldBorderWidth = 2
        self.view_otp.defaultBorderColor =  UIColor(red: 110/255.0, green: 114/255.0, blue: 130/255.0, alpha: 1)
        self.view_otp.filledBorderColor =  UIColor(red: 110/255.0, green: 114/255.0, blue: 130/255.0, alpha: 1)
        self.view_otp.cursorColor = UIColor.black
        self.view_otp.displayType = .roundedCorner
        self.view_otp.fieldSize = 46
        self.view_otp.separatorSpace = 6
        self.view_otp.shouldAllowIntermediateEditing = false
        self.view_otp.delegate = self
        self.view_otp.initializeUI()
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

