//
//  MapView.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject private var vm: PropertyViewModel
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude:-33.8837, longitude:151.2006),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    var body: some View {
        VStack{
            HStack{
                Text("Map")
                Spacer()
                Text("List")
            }.padding(.horizontal, 80)
            ZStack{
                Map(position: $cameraPosition) {
                    ForEach(vm.properties) {
                        property in
                        Annotation("", coordinate: property.coordinate) {
                            VStack {
                                PropertyAnnotationView()
                            }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    MapView()
        .environmentObject(PropertyViewModel())
}
