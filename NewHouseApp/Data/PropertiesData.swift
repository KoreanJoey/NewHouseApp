//
//  PropertiesData.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import Foundation
import MapKit

class PropertiesData {
    static let properties: [Property] = [
    Property(
        name: "PARAMOUNT HURSTVILLE", coordinate: CLLocationCoordinate2D(latitude: -33.966486, longitude: 151.1001671),address: "2-10 Woniora Rd, Hurstville", description: "Come home to space, style, and a stunning outlook. Every Melrose Central residence is a collaboration between two industry leaders. The Deicorp team and TURNER studio have brought their design expertise to shape an outstanding residential experience, made for modern living.", imageNames: ["DJI_0261","1719559103887_9"]
    ),
    Property(name: "MELOSE PARK", coordinate: CLLocationCoordinate2D(latitude: -33.8136438, longitude: 151.072535),address: "33 Hope Street, MelosePark", description: "Come home to space, style, and a stunning outlook. Every Melrose Central residence is a collaboration between two industry leaders.The Deicorp team and TURNER studio have brought their design expertise to shape an outstanding residential experience, made for modern living.", imageNames: ["1719559103887_9"])
    ]
}
