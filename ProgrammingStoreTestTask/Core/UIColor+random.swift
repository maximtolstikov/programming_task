//
//  ColorHelper.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import UIKit


extension UIColor {
    var random: UIColor {
        UIColor(
            red:   CGFloat.random(in: 0.0...1.0),
            green: CGFloat.random(in: 0.0...1.0),
            blue:  CGFloat.random(in: 0.0...1.0),
            alpha: CGFloat.random(in: 0.0...1.0)
        )
    }
}
