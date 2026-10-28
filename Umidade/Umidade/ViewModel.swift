import Foundation
import Combine




class SensorViewModel: ObservableObject {
    @Published var umidade = 0
    private var webSocketTask: URLSessionWebSocketTask?
    
    
    
    private func receber() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success (let message):
                switch message {
                case.string(let texto):
                    if let data = texto.data(using: .utf8),
                       let json = try? JSONSerialization.jsonObject(with:data) as? [String: Any] {
                        DispatchQueue.main.async {
                            self?.umidade = json["umidade"] as? Int ?? 0
                            print(self?.umidade ?? 0)
                        }
                    }
                default:
                    break
                }
            case .failure (let erro):
            print(erro)
        }
            self?.receber()
        }}
    func conectar() {
        let url = URL(string: "ws://192.168.128.217:81")!
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.resume()
        receber()
    }
}









