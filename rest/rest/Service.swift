import Foundation
struct Service {
    func fetchFotos (url: String) async throws -> [Foto] {
        guard let url = URL(string: url) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let values = try JSONDecoder().decode([Foto].self, from: data)
        return values
    }
}
