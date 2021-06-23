//
//  PolicyController.swift
//  vonder-app
//
//  Created by golf on 7/6/2564 BE.
//

import UIKit
import UICheckbox_Swift

class PolicyController : UIViewController {
    
    @IBOutlet weak var tv_policy: UITextView!
    @IBOutlet weak var cb_policy: UICheckbox!
    @IBOutlet weak var btn_policy: UIButton!
    var type : String = ""
    override func viewDidLoad() {
        tv_policy.backgroundColor =  UIColor(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        tv_policy.layer.borderColor =  UIColor(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0).cgColor
        tv_policy.layer.borderWidth = 1
        tv_policy.layer.cornerRadius = 6
        tv_policy.contentInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        btn_policy.isEnabled = false
        btn_policy.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
        btn_policy.setTitleColor(UIColor(red: 158/255.0, green: 160/255.0, blue: 172/255.0, alpha: 1), for: .normal)
        
        cb_policy.onSelectStateChanged = { (checkbox, selected) in
            if (selected){
                self.btn_policy.isEnabled = true
                self.btn_policy.backgroundColor = UIColor(red: 40/255.0, green: 127/255.0, blue: 222/255.0, alpha: 1)
                self.btn_policy.setTitleColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1), for: .normal)
            }else{
                self.btn_policy.isEnabled = false
                self.btn_policy.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
                self.btn_policy.setTitleColor(UIColor(red: 158/255.0, green: 160/255.0, blue: 172/255.0, alpha: 1), for: .normal)
            }
            print("Clicked - \(selected)")
        }

    }
    
    @IBAction func onPolicyClick(_ sender: Any) {
        if (type == "personal"){
            let vc = storyboard?.instantiateViewController(withIdentifier: "loginController") as? LoginController
            self.present(vc!, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "customNavigationController") as? CustomNavigationController
            self.present(vc!, animated: true)
        }
    }
    
//    @objc func actionLogin(sender : UITapGestureRecognizer){
//        print("cone open ")
//        let vc = storyboard?.instantiateViewController(withIdentifier: "loginController") as? LoginController
//        self.present(vc!, animated: true)
//    }
}

