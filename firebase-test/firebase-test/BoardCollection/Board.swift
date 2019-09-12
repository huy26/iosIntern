//
//  Board.swift
//  firebase-test
//
//  Created by Mac on 9/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

class Board: Codable{
    var title: String
    var items: [String]
    
    init(title: String, items: [String]) {
        self.title = title
        self.items = items
    }
}
