//
//  UIViewExtension.swift
//  course.io
//
//  Created by Xie kesong on 10/12/16.
//  Copyright © 2016 ___KesongXie___. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
