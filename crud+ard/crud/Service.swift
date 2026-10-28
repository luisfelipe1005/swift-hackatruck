import Foundation
struct Service {
    func fetchTemperaturas (url: String) async throws -> [Temperatura] {
        guard let url = URL(string: url) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let values = try JSONDecoder().decode([Temperatura].self, from: data)
        return values
    }
    
    func createTemperatura(url: String, temperatura: Temperatura) async throws {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    request.httpBody = try JSONEncoder().encode(temperatura)
    
        _ = try await URLSession.shared.data(for: request)
    
}}
