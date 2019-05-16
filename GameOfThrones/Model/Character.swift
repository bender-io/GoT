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
    let tvSeries : [String]
    var power : String {
        get {
            var power = 1
            if name != "" {
                power += name.count
            }
            if titles[0] != "" {
                power += (titles.count * 5)
            }
            if aliases[0] != "" {
                power += (aliases.count * 3)
            }
            if tvSeries[0] != "" {
                power += (tvSeries.count * 3)
            }
            return String(power)
        }
    }
}
