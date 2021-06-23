//
//  SearchController.swift
//  vonder-app
//
//  Created by golf on 7/6/2564 BE.
//

import UIKit

class SearchController : UIViewController {
    @IBOutlet weak var view_main: UIView!
    
    @IBOutlet weak var view_problem: UIView!
    @IBOutlet weak var lb_here: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view_main.isHidden = false
        view_problem.isHidden = true
        
        
        let gestureHere = UITapGestureRecognizer(target: self, action:  #selector(self.actionProblem))
        self.lb_here.isUserInteractionEnabled = true
        self.lb_here.addGestureRecognizer(gestureHere)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func onSearch(_ sender: Any) {
        view_main.isHidden = true
        view_problem.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
         super.viewDidDisappear(animated)
        view_main.isHidden = false
        view_problem.isHidden = true
    }
    
    @objc func actionProblem(sender : UITapGestureRecognizer){
       // print("cone open ")
        let vc = storyboard?.instantiateViewController(withIdentifier: "searchProblemController") as? SearchProblemController
        self.navigationController?.pushViewController(vc!, animated: true)
       
    }
}
