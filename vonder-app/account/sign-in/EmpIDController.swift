//
//  EmpIDController.swift
//  vonder-app
//
//  Created by golf on 7/6/2564 BE.
//

import UIKit

class EmpIDController : UIViewController {
    
    @IBOutlet weak var img_signin: UIImageView!
    @IBOutlet weak var view_signin: UIView!
    @IBOutlet weak var btn_signin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        view_signin.layer.cornerRadius = 10.0
        img_signin.layer.cornerRadius = 10.0
        
        self.btn_signin.isEnabled = false
        self.btn_signin.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
        self.btn_signin.setTitleColor(UIColor(red: 158/255.0, green: 160/255.0, blue: 172/255.0, alpha: 1), for: .normal)
        self.btn_signin.borderColor =  UIColor(red: 242/255.0, green: 242/255.0, blue: 245/255.0, alpha: 1)
        
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
