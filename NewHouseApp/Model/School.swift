//
//  School.swift
//  NewHouseApp
//
//  Created by 조성하 on 13/10/2024.
//

import Foundation
import CoreLocation

struct School: Codable, Identifiable {
    var id: String { School_code } // School_code를 ID로 사용
    let School_code: String
    let School_name: String
    let Latitude: String
    let Longitude: String
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: Double(Latitude) ?? 0.0, longitude: Double(Longitude) ?? 0.0)
    }
}
