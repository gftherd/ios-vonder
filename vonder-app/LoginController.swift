//
//  LoginController.swift
//  vonder-app
//
//  Created by golf on 7/6/2564 BE.
//

import UIKit
import Alamofire

class LoginController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tf_email: TextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var lb_signup: UILabel!
    let sharedPref = UserDefaults.standard
    override func viewDidLoad() {
        tf_email.delegate = self
        tf_password.delegate = self
        
        let gestureSignup = UITapGestureRecognizer(target: self, action:  #selector(self.actionRegister))
        self.lb_signup.isUserInteractionEnabled = true
        self.lb_signup.addGestureRecognizer(gestureSignup)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tf_email{
            tf_password.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    @objc func actionRegister(sender : UITapGestureRecognizer){
            print("cone open ")
            let vc = storyboard?.instantiateViewController(withIdentifier: "registerController") as? RegisterController
            self.present(vc!, animated: true)
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        let paramLogin : [String: String] = [
                        "username": self.tf_email.text! ,
                        "password" : self.tf_password.text!,
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
    }
    @IBAction func onLoginWithGuest(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "viewController") as? ViewController
        self.present(vc!, animated: true)
        sharedPref.setValue("", forKey: "id")
        sharedPref.setValue("", forKey:"token" )
    }
}



