
import Foundation



@Observable
class ViewModel {
    var comidas: [Comida] = []
    private let service = Service()
    func fetch() async {
        let url = "http://127.0.0.1:1880/pegar"
        do {
            comidas = try await service.fetchComidas (url: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    func addComida(novoComida: Comida) async {
            let url = "http://127.0.0.1:1880/criar"
            
            do {
                try await service.createComida(url: url, comida: novoComida)
                
                await fetch()
                
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    
    
}
