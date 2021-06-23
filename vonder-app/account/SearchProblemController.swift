//
//  SearchProblemController.swift
//  vonder-app
//
//  Created by golf on 7/6/2564 BE.
//

import UIKit


class SearchProblemController : UIViewController {
    
    @IBOutlet weak var view_problem: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view_problem.backgroundColor = .white
        view_problem.layer.cornerRadius = 10.0
        view_problem.layer.shadowColor = UIColor.gray.cgColor
        view_problem.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view_problem.layer.shadowRadius = 2.0
        view_problem.layer.shadowOpacity = 0.2
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
