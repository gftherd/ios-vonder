//
//  RegisterController.swift
//  vonder-app
//
//  Created by golf on 7/6/2564 BE.
//

import UIKit
import DTTextField

class RegisterController : UIViewController{
    @IBOutlet weak var tf_name: DTTextField!
    @IBOutlet weak var tf_surname: DTTextField!
    @IBOutlet weak var tf_email: DTTextField!
    @IBOutlet weak var tf_password: DTTextField!
    @IBOutlet weak var tf_re_password: DTTextField!
    
    override func viewDidLoad() {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func onOtp(_ sender: Any) {
        let paramLogin : [String: String] = [
                        "employeeId": self.tf_email.text! ,
                        "organizationId" : "5fc5fd8aec3811148292c5d4",
                        "type" : "0",
                        "username" : "gftherd11",
                        "firstName":self.tf_name.text!,
                        "lastName":self.tf_surname.text!,
                        "email":self.tf_email.text!,
                        "password":self.tf_password.text!,
                        "confirm":self.tf_re_password.text!
                        ]
        
        let param : [String : Any] = [
            "user":  paramLogin
        ]
        ServiceMain.callRegister(param: param) { [self] (response : MessageLoginResponse?, error : Error?) in
          
            if (response?.error != "username already register from platform-manager service"){
                let vc = storyboard?.instantiateViewController(withIdentifier: "otpController") as? OTPController
                vc?.id = response!.error!
                vc?.email = self.tf_email.text!
                vc?.password = self.tf_password.text!
                self.present(vc!, animated: true)
                
            }
        }
        
    }
}
