//
//  ProfileView.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var vm: PropertyViewModel
    @State var savedPropertyIDs: [String] = []
    @State private var filteredProperties: [Property] = []
    
    var body: some View {
        
        NavigationView {
            VStack {
                if filteredProperties.isEmpty {
                    Text("Nothing Saved")
                } else {
                    List {
                        ForEach(filteredProperties, id: \.id) {
                            property in
                            NavigationLink(destination: PropertyDetailView(property: property)) {
                                PropertyPreviewView(property: property)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Saved Property")
            .onAppear {
                loadSavedProperties()
            }
        }
    }
    
    func loadSavedProperties() {
        savedPropertyIDs = vm.getSavedPropertyIDs()
        filteredProperties = vm.properties.filter { savedPropertyIDs.contains($0.id) }
    }
}

#Preview {
    ProfileView()
        .environmentObject(PropertyViewModel())
}
