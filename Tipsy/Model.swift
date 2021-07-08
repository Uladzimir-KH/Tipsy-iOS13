//
//  Model.swift
//  Tipsy
//
//  Created by Vladimir Khrolovich on 8.07.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

enum Tips: Double {
    case zero = 0.0
    case ten = 0.1
    case twenty = 0.2
}

struct Tipsy {
    let bill: Double
    let tip: Tips
    let split: Double
    let result: String
    
    init(bill b: Double, tip t: Tips, split s: Double) {
        bill = b
        tip = t
        split = s
        result = String(format: "%.2f", (b + b * t.rawValue) / s)
    }
}


