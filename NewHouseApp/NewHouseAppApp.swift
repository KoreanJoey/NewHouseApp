//
//  NewHouseAppApp.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import SwiftUI

@main
struct NewHouseAppApp: App {
    
    @StateObject private var vm = PropertyViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
