import SwiftUI

struct Temperatura: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let temperatura: String?
}

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @State private var mostrarCriarTemperatura = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.red.opacity(0.7), Color.red.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        
                        ForEach(viewModel.temperaturas, id: \.self) { c in
                            
                            HStack {
                                Image(systemName: "thermometer.medium")
                                    .font(.system(size: 30))
                                    .foregroundColor(.red)
                                    .padding(.trailing, 8)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Temperatura Atual")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .textCase(.uppercase)
                                    
                                    Text("\(c.temperatura ?? "--") °C")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.primary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray.opacity(0.4))
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Minha IoT")
            
         
        }
       
        .task {
            await viewModel.fetch()
        }
    }
}

#Preview("ContentView") {
    ContentView()
}
