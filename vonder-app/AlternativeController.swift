//
//  AlternativeController.swift
//  vonder-app
//
//  Created by golf on 6/6/2564 BE.
//

import UIKit
import MessageUI

class AlternativeController : UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, MFMailComposeViewControllerDelegate {
   
    
    var imageArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5")]
    
    @IBOutlet weak var lb_support: PaddingLabel!
    @IBOutlet weak var view_personal: UIView!
    @IBOutlet weak var view_account: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view_personal.backgroundColor = .white
        view_personal.layer.cornerRadius = 10.0
        view_personal.layer.shadowColor = UIColor.gray.cgColor
        view_personal.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view_personal.layer.shadowRadius = 2.0
        view_personal.layer.shadowOpacity = 0.2
        
        
        view_account.backgroundColor = .white
        view_account.layer.cornerRadius = 10.0
        view_account.layer.shadowColor = UIColor.gray.cgColor
        view_account.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view_account.layer.shadowRadius = 2.0
        view_account.layer.shadowOpacity = 0.2
        
        let gesturePersonal = UITapGestureRecognizer(target: self, action:  #selector(self.actionPolicy))
      //  self.view_personal.isUserInteractionEnabled = true
        self.view_personal.addGestureRecognizer(gesturePersonal)
        
        
        let gestureAccount = UITapGestureRecognizer(target: self, action:  #selector(self.actionSlide))
      //  self.view_personal.isUserInteractionEnabled = true
        self.view_account.addGestureRecognizer(gestureAccount)
        
        
        let gestureSupport = UITapGestureRecognizer(target: self, action:  #selector(self.actionSendMail))
          self.lb_support.isUserInteractionEnabled = true
          self.lb_support.addGestureRecognizer(gestureSupport)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageViewCell", for: indexPath)
        as! ImageViewCell
        cell.img.image = imageArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row == 0 ){
            let vc = storyboard?.instantiateViewController(withIdentifier: "onboardingController") as? OnboardingController
            self.present(vc!, animated: true)
        }
    }
    
    @objc func actionPolicy(sender : UITapGestureRecognizer){
        print("cone open ")
        let vc = storyboard?.instantiateViewController(withIdentifier: "policyController") as? PolicyController
        vc!.type = "personal"
        self.present(vc!, animated: true)
    }
    
    @objc func actionSlide(sender : UITapGestureRecognizer){
        print("cone open ")
        let vc = storyboard?.instantiateViewController(withIdentifier: "policyController") as? PolicyController
        vc!.type = "account"
        self.present(vc!, animated: true)
       
    }
    
    
    @objc func actionSendMail(sender : UITapGestureRecognizer){
        if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["support@vonder.co.th"])
                mail.setMessageBody("", isHTML: true)

                present(mail, animated: true)
            } else {
                
            }
       
    }


}
