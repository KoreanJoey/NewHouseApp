//
//  AgentViewModel.swift
//  NewHouseApp
//
//  Created by 조성하 on 13/10/2024.
//

import Foundation
import Supabase

class AgentViewModel: ObservableObject {
    @Published var agents: [Agent] = []
    
    let client = SupabaseClient(
        supabaseURL: URL(string: "https://qqejfyhvcjwgsobrexwx.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFxZWpmeWh2Y2p3Z3NvYnJleHd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg3ODI4ODEsImV4cCI6MjA0NDM1ODg4MX0.TYmhe9VcooUe7-PmZqcjf8RGwmUaqab04ydDjlpOEyw"
    )
    
    func fetchAgents() async {
        do {
            // 에이전트 리스트 데이터를 Supabase에서 가져오기
            let fetchedAgents: [Agent] = try await client
                .from("agents")
                .select()
                .execute()
                .value
            
            // 가져온 데이터를 agents 배열에 저장
            DispatchQueue.main.async {
                self.agents = fetchedAgents
            }
        } catch {
            debugPrint("Error fetching agents: \(error)")
        }
    }
}


