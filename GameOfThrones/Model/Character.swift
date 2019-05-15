//
//  Character.swift
//  GameOfThrones
//
//  Created by Brian Hersh on 5/14/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

struct Character : Decodable {
    let name : String
    let culture : String
    let titles : [String]
    let aliases : [String]
//    let seasons
    var power : String {
        get {
            var power = titles.count
            power += aliases.count
            return String(power)
        }
    }
}
