//
//  Label+RoundedButton.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit

extension UILabel {
    
    func RoundedLabel(cornerRadius : CGFloat , borderWidth : CGFloat? , borderColor : CGColor?  ){
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = borderColor
    }
    
}
