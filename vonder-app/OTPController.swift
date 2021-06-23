//
//  OTPController.swift
//  vonder-app
//
//  Created by golf on 7/6/2564 BE.
//

import UIKit
import OTPFieldView

class OTPController : UIViewController, OTPFieldViewDelegate{
    var id  : String = ""
    var otp : String = ""
    var email : String = ""
    var password : String = ""
    var username : String = "gftherd11"
    let sharedPref = UserDefaults.standard
    @IBOutlet weak var lbEmail: UILabel!
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
           print("Has entered all OTP? \(hasEntered)")
           return false
       }
       
       func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
           return true
       }
       
       func enteredOTP(otp otpString: String) {
           otp = otpString
       }
    
 

    @IBOutlet var otpTextFieldView: OTPFieldView!
    @IBOutlet weak var btn_otp: UIButton!
    override func viewDidLoad() {
        self.btn_otp.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        self.btn_otp.setTitleColor(UIColor(red: 158/255.0, green: 160/255.0, blue: 172/255.0, alpha: 1), for: .normal)
        self.btn_otp.borderColor =  UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
        setupOtpView()
        lbEmail.text = email
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupOtpView(){
            self.otpTextFieldView.fieldsCount = 6
            self.otpTextFieldView.fieldBorderWidth = 2
            self.otpTextFieldView.defaultBorderColor =  UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
            self.otpTextFieldView.filledBorderColor =  UIColor(red: 110/255.0, green: 114/255.0, blue: 130/255.0, alpha: 1)
            self.otpTextFieldView.cursorColor = UIColor.black
            self.otpTextFieldView.displayType = .roundedCorner
            self.otpTextFieldView.fieldSize = 50
            self.otpTextFieldView.separatorSpace = 8
            self.otpTextFieldView.shouldAllowIntermediateEditing = false
            self.otpTextFieldView.delegate = self
            self.otpTextFieldView.initializeUI()
        }
    @IBAction func onSubmit(_ sender: Any) {
        print("otp : " , otp)
        print("email : " , email)
        let param : [String: String] = [
                        "data": email ,
                        "otp" : otp,
                        "type":"email"
                        ]
        ServiceMain.callVerifyOTP(param: param) { [self] (response : MessageLoginResponse?, error : Error?) in
            if (response?.error == ""){
                let paramLogin : [String: String] = [
                                "username": username ,
                                "password" : password,
                                "orgId" : "5fc5fd8aec3811148292c5d4",
                                "type" : "app"
                                ]
                ServiceMain.callLogin(param: paramLogin) { [self] (response : MessageLoginResponse?, error : Error?) in
                    sharedPref.setValue(response?._id, forKey: "id")
                    sharedPref.setValue(response?.token, forKey:"token")
                    if (response?.error == ""){
                        let vc = storyboard?.instantiateViewController(withIdentifier: "viewController") as? ViewController
                        self.present(vc!, animated: true)
                    }else{
                        
                    }
                }
            }else{
                
            }
        }
    }
    
    @IBAction func onNewRequest(_ sender: Any) {
        
        let paramResendOTP : [String: String] = [
                        "id": id ,
                        "orgId" : "5fc5fd8aec3811148292c5d4",
                        ]

        ServiceMain.callResendOTP(param: paramResendOTP) { [self] (response : MessageLoginResponse?, error : Error?) in

        }
    }
}
