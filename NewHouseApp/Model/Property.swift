//
//  Property.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import Foundation
import MapKit

struct Property: Identifiable, Equatable {
    
    let name : String
    let coordinate : CLLocationCoordinate2D
    let address : String
    let description : String
    let imageNames: [String]
    
    
    //Identifiable
    var id: String{
        name + address
    }
    
    //Equatable
    static func == (lhs: Property, rhs: Property) -> Bool {
        lhs.id == rhs.id
    }
}
