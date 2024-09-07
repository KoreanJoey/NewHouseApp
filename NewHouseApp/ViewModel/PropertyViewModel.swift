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
            updatePropertyRegion(property: currentProperty)
        }
    }
    
    
    @Published var propertyRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let properties = PropertiesData.properties
        self.properties = properties
        self.currentProperty = properties.first!
        
        self.updatePropertyRegion(property: properties.first!)
    }
    
    private func updatePropertyRegion(property: Property) {
        withAnimation(.easeInOut) {
            propertyRegion = MKCoordinateRegion(
                center: property.coordinate, span: mapSpan)
        }
    }
    
}
