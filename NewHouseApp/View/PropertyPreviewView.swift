//
//  PropertyPreviewView.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import SwiftUI

struct PropertyPreviewView: View {
    
    let property: Property
    
    var body: some View {
        HStack(spacing: 16.0){
            ZStack{
                if let imageName = property.imageNames.first {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                }
            }
            .padding(6)
            .background(Color.white)
            .cornerRadius(10)
            VStack(alignment: .leading){
                Text("NEW APARTMENTS")
                    .font(.caption)
                    .foregroundStyle(Color.gray)
                    .bold()
                Text(property.name)
                    .font(.title3)
                    .bold()
                Text(property.address)
                HStack{
                    Spacer()
                    Image(systemName: "star")
                }
                .padding(.horizontal)
            }
        }
        .background(Color.white)
    }
}

#Preview {
    ZStack {
        //Color.blue.ignoresSafeArea()
        PropertyPreviewView(property: PropertiesData.properties.first!)
    }
}
