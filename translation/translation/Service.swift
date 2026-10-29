import Foundation
struct Service {
    func fetchComidas (url: String) async throws -> [Comida] {
        guard let url = URL(string: url) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let values = try JSONDecoder().decode([Comida].self, from: data)
        return values
    }
    
    func createComida(url: String, comida: Comida) async throws {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    request.httpBody = try JSONEncoder().encode(comida)
    
        _ = try await URLSession.shared.data(for: request)
    
}}
