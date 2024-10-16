//
//  AgentView.swift
//  NewHouseApp
//
//  Created by 조성하 on 6/9/2024.
//

import SwiftUI

struct AgentView: View {
    
    @StateObject var viewModel = AgentViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.agents) { agent in
                VStack(alignment: .leading) {
                    Text(agent.name)
                        .font(.headline)
                    HStack {
                        StarRatingView(rating: agent.rating)
                    }
                    Text("Company: \(agent.company)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(agent.description)
                        .font(.body)
                        .lineLimit(2)
                        .padding(.top, 5)
                }
                .padding(.vertical, 8)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Agents")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddAgentView(viewModel: viewModel)) {
                        Image(systemName: "plus.circle")
                            .font(.title2)
                            .foregroundStyle(Color(red: 238/255, green: 108/255, blue: 157/255))
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchAgents()
                }
            }
        }
    }
}

struct StarRatingView: View {
    let rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1..<6) { index in
                Image(systemName: index <= Int(rating) ? "star.fill" : "star")
                    .foregroundColor(index <= Int(rating) ? .yellow : .gray)
            }
        }
    }
}

#Preview {
    AgentView()
}
