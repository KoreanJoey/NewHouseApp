//
//  PropertyViewModel.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import Foundation

class PropertyViewModel: ObservableObject {
    //All loaded properties
    @Published var properties: [Property]
    
    init() {
        let properties = PropertiesData.properties
        self.properties = properties
    }
}
