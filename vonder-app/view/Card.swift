//
//  Card.swift
//  vonder-app
//
//  Created by Therdsak Paradeewirai on 10/5/2564 BE.
//

import Foundation
import UIKit

class CardView : UIView {
    @IBInspectable var cornerRadius : CGFloat = 10
    var ofsetWidth : CGFloat = 5
    var ofsetHeight : CGFloat = 5
    
    
    var ofsetShadowOpacity : Float = 10
    var colour =  UIColor(red: 95/255, green: 95/255, blue: 96/255, alpha: 0.1)
    
    override func layoutSubviews() {
        layer.cornerRadius = self.cornerRadius
        layer.borderColor = self.colour.cgColor
        layer.shadowColor = self.colour.cgColor
        layer.shadowOffset = CGSize(width: self.ofsetWidth, height: self.ofsetHeight)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        layer.shadowOpacity = self.ofsetShadowOpacity
        
    }
    
}
    
