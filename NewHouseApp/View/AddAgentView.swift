//
//  AddAgentView.swift
//  NewHouseApp
//
//  Created by 조성하 on 13/10/2024.
//

import SwiftUI

struct AddAgentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var rating: Double = 0.0
    @State private var company: String = ""
    @State private var description: String = ""
    @ObservedObject var viewModel: AgentViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Agent Information")) {
                    TextField("Name", text: $name)
                    TextField("Company", text: $company)
                    TextField("Description", text: $description)
                }
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    viewModel.addAgent(name: name, rating: rating, company: company, description: description) { success in
                        if success {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }) {
                    Text("Add Agent")
                        .frame(maxWidth: .infinity)
                }
                .disabled(name.isEmpty || company.isEmpty || description.isEmpty)
            }
            .navigationTitle("Add New Agent")
        }
    }
}

#Preview {
    AddAgentView(viewModel: AgentViewModel())
}
