//
//  ContentView.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MapView()
                .tabItem {
                    Image(systemName:"map")
                    Text("Map")
                }
//            AgentView()
//                .tabItem {
//                    Image(systemName:"person")
//                    Text("Agent")
//                }
            ProfileView()
                .tabItem {
                    Image(systemName:"star.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(PropertyViewModel())
}
