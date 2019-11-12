//
//  iTunes.swift
//  CupcakeCorner
//
//  Created by Mihai Leonte on 11/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
