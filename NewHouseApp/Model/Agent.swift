//
//  Agent.swift
//  NewHouseApp
//
//  Created by 조성하 on 13/10/2024.
//

import Foundation

struct Agent: Identifiable, Codable {
    let id: Int
    let name: String
    let rating: Double
    let company: String
    let description: String
}
