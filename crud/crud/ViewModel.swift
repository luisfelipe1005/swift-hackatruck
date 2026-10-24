import Foundation



@Observable
class ViewModel {
    var monstros: [Monstro] = []
    private let service = Service()
    func fetch() async {
        let url = "http://127.0.0.1:1880/adicionar"
        do {
            monstros = try await service.fetchMonstros (url: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    func addMonstro(novoMonstro: Monstro) async {
            let url = "http://127.0.0.1:1880/criar"
            
            do {
                try await service.createMonstro(url: url, monstro: novoMonstro)
                
                await fetch()
                
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    
    
}
