//
//  MenuBox.swift
//  NewHouseApp
//
//  Created by 조성하 on 20/9/2024.
//

import SwiftUI

struct MenuBox: View {
    let label: String
    let iconName: String
    let isSelected: Bool
    let selectedColor: Color
    
    var body: some View {
        VStack(spacing:0){
            Image(systemName: iconName)
            //.resizable()
                .frame(width: 20, height: 20)
                .padding(0)
            Text(label)
                .font(.system(size:15))
                .padding(0)
        }
        .frame(width: 60, height: 60)
        .foregroundStyle(isSelected ? .white : .black)
        .background(isSelected ? selectedColor : .white)
        .border(Color.gray, width: 0.5)
    }
}

struct MenuView: View{
    
    @EnvironmentObject private var vm: PropertyViewModel
    
    
    var body: some View {
        VStack(spacing:0) {
            MenuBox(label: "Property", iconName: "house", isSelected: vm.showingPropertyAnnotation, selectedColor: Color(red: 238/255, green: 108/255, blue: 157/255))
                .padding(.vertical)
                .onTapGesture {
                    vm.showingPropertyAnnotation.toggle()
                }
            MenuBox(label: "Metro", iconName: "tram", isSelected: vm.showingMetroAnnotation, selectedColor: Color(red: 135/255, green: 206/255, blue: 235/255))
                .onTapGesture {
                    toggleMetro()
                }
            MenuBox(label: "School", iconName: "book", isSelected: vm.showingSchoolAnnotation, selectedColor: Color(red: 186/255, green: 104/255, blue: 200/255))
                .onTapGesture {
                    toggleSchool()
                }
            MenuBox(label: "Develop", iconName: "lightbulb.max", isSelected: vm.showingDevelopAnnotation, selectedColor: Color(red: 255/255, green: 159/255, blue: 64/255))
                .onTapGesture {
                    toggleDevelop()
                }
        }
    }
    
    
    // Menu Toggle Functions
    private func toggleMetro() {
        if vm.showingMetroAnnotation {
            vm.showingMetroAnnotation = false
        } else {
            vm.showingMetroAnnotation = true
            vm.showingSchoolAnnotation = false
            vm.showingDevelopAnnotation = false
        }
    }
    
    private func toggleSchool() {
        if vm.showingSchoolAnnotation {
            vm.showingSchoolAnnotation = false
        } else {
            vm.showingSchoolAnnotation = true
            vm.showingMetroAnnotation = false
            vm.showingDevelopAnnotation = false
        }
    }
    
    private func toggleDevelop() {
        if vm.showingDevelopAnnotation {
            vm.showingDevelopAnnotation = false
        } else {
            vm.showingDevelopAnnotation = true
            vm.showingMetroAnnotation = false
            vm.showingSchoolAnnotation = false
        }
    }
}


#Preview {
    //MenuBox(label: "star", iconName: "star")
    MenuView()
        .environmentObject(PropertyViewModel())
}
