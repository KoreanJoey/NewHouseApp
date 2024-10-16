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
    @Published var seeingProperty: Bool = false
    @Published var showingPropertyAnnotation: Bool = true
    @Published var showingMetroAnnotation: Bool = false
    @Published var showingSchoolAnnotation: Bool = false
    @Published var showingDevelopAnnotation: Bool = false
    @Published var schools: [School] = []
    
    
    init() {
        let properties = PropertiesData.properties
        self.properties = properties
        self.currentProperty = properties.first!
    }
    
    func chooseProperty(property: Property) {
        currentProperty = property
    }
    
    func savePropertyID(_ propertyID: String) {
        var savedPropertyIDs = UserDefaults.standard.stringArray(forKey: "savedPropertyIDs") ?? []
        if !savedPropertyIDs.contains(propertyID) {
            savedPropertyIDs.append(propertyID)
            UserDefaults.standard.set(savedPropertyIDs, forKey: "savedPropertyIDs")
            print("Saved Property ID: \(propertyID)")
        }
    }
    
    func removePropertyID(_ propertyID: String) {
        var savedPropertyIDs = UserDefaults.standard.stringArray(forKey: "savedPropertyIDs") ?? []
        if let index = savedPropertyIDs.firstIndex(of: propertyID) {
            savedPropertyIDs.remove(at: index)
            UserDefaults.standard.set(savedPropertyIDs, forKey: "savedPropertyIDs")
            print("Removed Property ID: \(propertyID)")
        }
    }
    
    
    func getSavedPropertyIDs() -> [String] {
        return UserDefaults.standard.stringArray(forKey: "savedPropertyIDs") ?? []
    }
    
    func toggleSaved(property: Property) {
        if let index = properties.firstIndex(where: { $0.id == property.id}) {
            properties[index].isSaved.toggle()
            print("Toggled isSaved for property: \(property.name), new value: \(properties[index].isSaved), id: \(property.id)")
            
            if properties[index].isSaved {
                savePropertyID(property.id)
            } else {
                removePropertyID(property.id)
            }
            properties = properties
        }
    }
    
    func loadSchools() {
            guard let url = Bundle.main.url(forResource: "schools", withExtension: "json") else {
                print("JSON file not found")
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([School].self, from: data)
                schools = decodedData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
}
