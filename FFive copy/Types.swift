//
//  Types.swift
//  FFive
//
//  Created by Tylure Lincoln on 2018-07-03.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    static let None:    UInt32 = 0
    static let All:     UInt32 = 0xFFFFFFFF
    static let Edge:    UInt32 = 0b1
    static let Player:  UInt32 = 0b10
}

