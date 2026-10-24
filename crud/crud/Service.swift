import Foundation
struct Service {
    func fetchMonstros (url: String) async throws -> [Monstro] {
        guard let url = URL(string: url) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let values = try JSONDecoder().decode([Monstro].self, from: data)
        return values
    }
    
    func createMonstro(url: String, monstro: Monstro) async throws {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    request.httpBody = try JSONEncoder().encode(monstro)
    
        _ = try await URLSession.shared.data(for: request)
    
}}
