//
//  AddAgentView.swift
//  NewHouseApp
//
//  Created by 조성하 on 13/10/2024.
//

import SwiftUI

struct AddAgentView: View {
    @State private var name: String = ""
    @State private var rating: Double = 0.0
    @State private var company: String = ""
    @State private var description: String = ""
    @ObservedObject var viewModel: AgentViewModel
    @Environment(\.dismiss) var dismiss
    @State private var showSuccessMessage = false
    
    var body: some View {
        NavigationView {
            if showSuccessMessage {
                VStack {
                    Text("Successfully Added Agent!")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 238/255, green: 108/255, blue: 157/255))
                        .transition(.opacity)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        dismiss()
                        
                    }
                }
            } else {
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
                        viewModel.addAgent(name: name, company: company, description: description) { success in
                            if success {
                                withAnimation {
                                    showSuccessMessage = true
                                }
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
}

#Preview {
    AddAgentView(viewModel: AgentViewModel())
}
