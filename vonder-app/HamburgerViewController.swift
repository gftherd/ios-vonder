//
//  HamburgerViewController.swift
//  HamburgerMenu
//
//  Created by Kashyap on 13/11/20.
//

import UIKit

protocol HamburgerViewControllerDelegate {
    func hideHamburgerMenu()
}
class HamburgerViewController: UIViewController {

    @IBOutlet weak var icon_add: UIImageView!
    @IBOutlet weak var constraint_email: NSLayoutConstraint!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var constraint_btn: NSLayoutConstraint!
    @IBOutlet weak var constraint_height_add: NSLayoutConstraint!
    
    @IBOutlet weak var constraint_point: NSLayoutConstraint!
    
    @IBOutlet weak var height_edit: NSLayoutConstraint!
    @IBOutlet weak var height_manage: NSLayoutConstraint!
    @IBOutlet weak var constraint_edit: NSLayoutConstraint!
    @IBOutlet weak var constraint_coin: NSLayoutConstraint!
    @IBOutlet weak var constraint_diamond: NSLayoutConstraint!
    
    @IBOutlet weak var constaint_edit: NSLayoutConstraint!
    @IBOutlet weak var constaint_label_edit: NSLayoutConstraint!
    @IBOutlet weak var constaint_manage: NSLayoutConstraint!
    @IBOutlet weak var constaint_label_manage: NSLayoutConstraint!
    @IBOutlet weak var constaint_contact: NSLayoutConstraint!
    @IBOutlet weak var constaint_label_contact: NSLayoutConstraint!
    @IBOutlet weak var constaint_signout: NSLayoutConstraint!
    @IBOutlet weak var constaint_label_signout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sharedPref = UserDefaults.standard
        print("test : " , sharedPref.string(forKey: "token"))
        
       
        if (sharedPref.string(forKey: "token") != "" && sharedPref.string(forKey: "token") != nil){
            print("1")
            constraint_btn.constant = 0
            constraint_email.constant = 20
            constraint_point.constant = 30
            constraint_coin.constant = 20
            constraint_diamond.constant = 20
            constraint_height_add.constant = 30
            icon_add.image =  UIImage(named:
                                        "vector")?.withAlignmentRectInsets(UIEdgeInsets(top: -8, left: -8, bottom: 0,
                                        right: -8))
            constaint_edit.constant = 30
            constaint_label_edit.constant = 20
            constaint_manage.constant = 30
            constaint_label_manage.constant = 20
            constaint_contact.constant = 30
            constaint_label_contact.constant = 20
            constaint_signout.constant = 30
            constaint_label_signout.constant = 20
            height_edit.constant = 24
            height_manage.constant = 24
        }else{
            print("2")
            constraint_btn.constant = 40
            constraint_email.constant = 0
            constraint_point.constant = 0
            constraint_coin.constant = 0
            constraint_diamond.constant = 0
            constraint_height_add.constant = 0
            lbName.text = "Guest"
            
            constaint_edit.constant = 0
            constaint_label_edit.constant = 0
            constaint_manage.constant = 0
            constaint_label_manage.constant = 0
            constaint_contact.constant = 0
            constaint_label_contact.constant = 0
            constaint_signout.constant = 0
            constaint_label_signout.constant = 0
            
            height_edit.constant = 0
            height_manage.constant = 0
           
        }
    }
    @IBAction func onLogin(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "loginController") as? LoginController
        self.present(vc!, animated: true)
    }
}
