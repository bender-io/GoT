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
    let titles : [Titles]
    let aliases : [Aliases]
    let power : Int = 0
}

struct Titles : Decodable {
    let title : String
}

struct Aliases : Decodable {
    let alias : String
}
