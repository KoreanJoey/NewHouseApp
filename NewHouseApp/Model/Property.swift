//
//  Property.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import Foundation
import MapKit

struct Property: Identifiable {
    let id = UUID().uuidString
    let name : String
    let coordinate : CLLocationCoordinate2D
    let description : String
    let imageNames: [String]
}
