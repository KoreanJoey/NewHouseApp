//
//  PropertyViewModel.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import Foundation
import MapKit
import SwiftUI

class PropertyViewModel: ObservableObject {
    // All loaded properties
    @Published var properties: [Property]
    // Current property on map
    @Published var currentProperty: Property{
        didSet {
            seeingProperty = true
        }
    }
    @Published var seeingProperty:Bool = false
    
    init() {
        let properties = PropertiesData.properties
        self.properties = properties
        self.currentProperty = properties.first!
        
    }
    
    func chooseProperty(property: Property) {
        currentProperty = property
    }
    
}
