//
//  Colors.swift
//  colorTest
//
//  Created by Alex on 7/9/18.
//  Copyright © 2018 SweatNet. All rights reserved.
//

import Foundation
import UIKit

final class Colors {
    var h = CGFloat(0)
    
    func createColor() -> UIColor? {
        if let seed = UserDefaults.standard.object(forKey: "color_seed") as? CGFloat {
            h = seed
        } else {
            h = CGFloat(arc4random()) / CGFloat(UInt32.max)
        }
        let golden_ratio_conjugate = CGFloat(0.618033988749895)
        h += golden_ratio_conjugate
        h = h.truncatingRemainder(dividingBy: 1.0)
        let seed = h
        let color = UIColor(hue: (360.0*h), saturation: CGFloat(50), brightness: CGFloat(95), alpha: 1.0)
        return color
    }
}
