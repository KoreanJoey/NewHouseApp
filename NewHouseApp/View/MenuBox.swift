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
        .background(.white)
        .border(Color.gray, width: 0.5)
    }
}

struct MenuView: View{
    var body: some View {
        VStack(spacing:0) {
            MenuBox(label: "Property", iconName: "house")
                .padding(.vertical)
            MenuBox(label: "Metro", iconName: "tram")
            MenuBox(label: "School", iconName: "book")
            MenuBox(label: "Develop", iconName: "lightbulb.max")
        }
    }
}


#Preview {
    //MenuBox(label: "star", iconName: "star")
    MenuView()
}
