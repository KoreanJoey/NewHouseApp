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
    @State private var showingDetail = false
    
    
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
                            VStack { if vm.showingPropertyAnnotation {
                                PropertyAnnotationView()
                                    .shadow(radius: 3)
                                    .onTapGesture {
                                        vm.chooseProperty(property: property)
                                    }
                            }
                                
                            }
                        }
                    }
                }
                HStack{ //Property, Metro, School choice boxes
                    Spacer()
                    VStack{
                        MenuView()
                            .padding()
                        Spacer()
                    }
                }
                VStack{
                    Spacer()
                    if vm.seeingProperty{
                        PropertyPreviewView(property: vm.currentProperty)
                            .onTapGesture {
                                showingDetail = true
                            }
                            .gesture(
                                DragGesture()
                                    .onEnded{gesture in
                                        if gesture.translation.height > 20 {
                                            withAnimation{
                                                vm.seeingProperty = false
                                            }
                                        }})
                    }
                }
            }
        }
        .sheet(isPresented: $showingDetail) {
            PropertyDetailView(property: vm.currentProperty)
        }
    }
}

#Preview {
    MapView()
        .environmentObject(PropertyViewModel())
}

