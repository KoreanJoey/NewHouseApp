//
//  PropertyAnnotationView.swift
//  NewHouseApp
//
//  Created by 조성하 on 7/9/2024.
//

import SwiftUI

struct PropertyAnnotationView: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack{
                Circle()
                    .frame(width: 30)
                    .foregroundStyle(.white)
                Circle()
                    .frame(width: 23)
                    .foregroundStyle(.red)
            }
        })
    }
}

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        PropertyAnnotationView()
    }
}
