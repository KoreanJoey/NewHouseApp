//
//  PropertyDetailView.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import SwiftUI

struct PropertyDetailView: View {
    
    let property: Property
    @State var inquery: String = ""
    
    var body: some View {
        VStack{
            TabView{
                ForEach(property.imageNames, id: \.self) {
                    image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                }
            }
            //.background(Color.blue)
            .frame(height: 280)
            .tabViewStyle(.page)
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text(property.name)
                        .font(.title3)
                        .bold()
                    Text(property.address)
                    
                }
                //.background(Color.blue)
                .padding(.horizontal)
                Spacer()
                HStack{
                    
                    Image(systemName: "star")
                    Image(systemName: "square.and.arrow.up")
                }
                //.background(Color.blue)
                    
                
            }
            //.background(Color.red)
            
            Divider()
                .background(Color.gray)
                .frame(height: 5)
            
            VStack(alignment: .leading){
                Text("Property Information")
                    .font(.title3)
                    .bold()
                Text(property.description)
            }
            
            Divider()
                .background(Color.gray)
                .frame(height: 5)
            
            VStack{
                TextField("I want to ask about the \(property.name)", text: $inquery)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1))
                
                Button(action: {
                    
                }, label: {
                    Text("Send email to Agent")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                })
                .background(Color.blue)
                            .cornerRadius(2)
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal)
            
        }
        .onAppear{
            inquery = "I want to ask about the \(property.name)"
        }
    }
}

#Preview {
    PropertyDetailView(property: PropertiesData.properties.first!)
}
