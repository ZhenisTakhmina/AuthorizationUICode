//
//  UIView+Extensions.swift
//  inventory
//
//  Created by Tami on 05.01.2024.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
     let cornerRadii = CGSize(width: radius, height: radius)
     let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
     let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
}
