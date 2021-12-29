//
//  Extensions.swift
//  Mevron Test
//
//  Created by GIGL iOS on 29/12/2021.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var cornerRadious: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
}
