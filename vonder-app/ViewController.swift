//
//  ViewController.swift
//  HamburgerMenu
//
//  Created by Kashyap on 13/11/20.
//

import UIKit

class ViewController: UIViewController  {
    
    
    
    @IBOutlet weak var mainBackView: UIView!
    @IBOutlet weak var hamburgerView: UIView!
    @IBOutlet weak var backViewForHamburger: UIView!
    @IBOutlet weak var img_ham: UIImageView!
    
    @IBOutlet weak var leadingConstraintForHamburgerView: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.backViewForHamburger.isHidden = true
        let gestureHam = UITapGestureRecognizer(target: self, action:  #selector(self.actionMenu))
        self.img_ham.isUserInteractionEnabled = true
        self.img_ham.addGestureRecognizer(gestureHam)
        
        
        let gestureBackView = UITapGestureRecognizer(target: self, action:  #selector(self.actionBackView))
        self.backViewForHamburger.isUserInteractionEnabled = true
        self.backViewForHamburger.addGestureRecognizer(gestureBackView)
       
    }
    
    
    @objc func actionMenu(sender : UITapGestureRecognizer){
        UIView.animate(withDuration: 0.3) {
            self.leadingConstraintForHamburgerView.constant = 10
            self.view.layoutIfNeeded()
        } completion: { (status) in
            self.backViewForHamburger.alpha = 0.75
            self.backViewForHamburger.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.leadingConstraintForHamburgerView.constant = 0
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.isHamburgerMenuShown = true
            }

        }

        self.backViewForHamburger.isHidden = false
    }
    
    
    @objc func actionBackView(sender : UITapGestureRecognizer){
        self.hideHamburgerView()
    }
    
    
    private var isHamburgerMenuShown:Bool = false
    private var beginPoint:CGFloat = 0.0
    private var difference:CGFloat = 0.0
    @IBAction func tappedOnHamburgerbackView(_ sender: Any) {
        print("come in back ")
    }
    
    func hideHamburgerMenu() {
        self.hideHamburgerView()
    }
    
    
    private func hideHamburgerView()
        {
            UIView.animate(withDuration: 0.3) {
                self.leadingConstraintForHamburgerView.constant = 10
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.backViewForHamburger.alpha = 0.0
                UIView.animate(withDuration: 0.3) {
                    self.leadingConstraintForHamburgerView.constant = -280
                    self.view.layoutIfNeeded()
                } completion: { (status) in
                    self.backViewForHamburger.isHidden = true
                    self.isHamburgerMenuShown = false
                }
            }
    }
    
    
    var hamburgerViewController : HamburgerViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "hamburgerSegue")
//            {
//                if let controller = segue.destination as? HamburgerViewController
//                {
//                    self.hamburgerViewController = controller
//                    self.hamburgerViewController?.delegate = self
//                }
//        }
    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if (isHamburgerMenuShown)
            {
                 if let touch = touches.first
                {
                    let location = touch.location(in: backViewForHamburger)
                    beginPoint = location.x
                }
            }
        }
    
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            if (isHamburgerMenuShown)
            {
                if let touch = touches.first
                {
                    let location = touch.location(in: backViewForHamburger)
    
                    let differenceFromBeginPoint = beginPoint - location.x
    
                    if (differenceFromBeginPoint>0 || differenceFromBeginPoint<280)
                    {
                        difference = differenceFromBeginPoint
                        self.leadingConstraintForHamburgerView.constant = -differenceFromBeginPoint
                        self.backViewForHamburger.alpha = 0.75-(0.75*differenceFromBeginPoint/280)
                    }
                }
            }
        }
    
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            if (isHamburgerMenuShown)
            {
                if (difference>140)
                {
                    UIView.animate(withDuration: 0.3) {
                        self.leadingConstraintForHamburgerView.constant = -290
                    } completion: { (status) in
                        self.backViewForHamburger.alpha = 0.0
                        self.isHamburgerMenuShown = false
                        self.backViewForHamburger.isHidden = true
                    }
                }
                else{
                    UIView.animate(withDuration: 0.3) {
                        self.leadingConstraintForHamburgerView.constant = -10
                    } completion: { (status) in
                        self.backViewForHamburger.alpha = 0.75
                        self.isHamburgerMenuShown = true
                        self.backViewForHamburger.isHidden = false
                    }
                }
            }
        }
}


