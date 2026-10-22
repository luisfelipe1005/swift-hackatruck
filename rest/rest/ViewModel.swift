import Foundation


var datainicial: String = "140901"
var datafinal: String = "140930"


@Observable
class ViewModel {
    var fotos: [Foto] = []
    private let service = Service()
    func fetch() async {
        
        
        
        let url = "https://science.nasa.gov/wp-json/wp/v2/apod-basic?date_from=\(datainicial)&date_to=\(datafinal)"
        do {
            fotos = try await service.fetchFotos (url: url)
        } catch {
            print(error.localizedDescription)
        }
    }
}
