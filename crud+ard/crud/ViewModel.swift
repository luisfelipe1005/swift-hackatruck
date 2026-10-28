import Foundation



@Observable
class ViewModel {
    var temperaturas: [Temperatura] = []
    private let service = Service()
    func fetch() async {
        let url = "http://192.168.128.252:1880/pegar"
        do {
            temperaturas = try await service.fetchTemperaturas (url: url)
            print(temperaturas)
        } catch {
            print(error.localizedDescription)
        }
    }

    
    
}
