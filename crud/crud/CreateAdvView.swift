import SwiftUI
import FirebaseAI

struct CreateAdvView: View {
    
    var viewModel: ViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var cr: String = ""
    @State private var size: String = ""
    @State private var type: String = ""
    @State private var ca: String = ""
    @State private var hp: String = ""
    @State private var speed: String = ""
    @State private var skill: String = ""
    @State private var resistances: String = ""
    @State private var immunities: String = ""
    @State private var senses: String = ""
    @State private var languages: String = ""
    
    @State private var str: String = ""
    @State private var dex: String = ""
    @State private var con: String = ""
    @State private var int: String = ""
    @State private var sab: String = ""
    @State private var car: String = ""
    
    @State private var traits: String = ""
    @State private var actions: String = ""
    @State private var hdurl: String = ""
    
    
    
    @State var prompt: String = ""
    @State var iaResponse: String = ""
    @State var isLoading: Bool = false
    
     let model = FirebaseAI.firebaseAI(backend: .googleAI()).generativeModel(modelName: "gemini-3.1-flash-lite")
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    if isLoading {
                        ProgressView("Pensando...")
                            .padding()
                    } else {
                        Text(iaResponse)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
                
                Spacer()
                
                HStack {
                    TextField("Pergunte algo à IA...", text: $prompt)
                        .textFieldStyle(.roundedBorder)
                        .disabled(isLoading)
                    
                    Button(action: {
                        sendMessage()
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(prompt.isEmpty || isLoading ? Color.gray : Color.blue)
                            .clipShape(Circle())
                    }
                    .disabled(prompt.isEmpty || isLoading)
                }
                .padding()
            }
            .navigationTitle("Chat com IA")
        }
    }
    
    func sendMessage() {
            let userPrompt = """
                Você é um assistente criador de monstros para o RPG Tales of the Valiant.
                A sua única missão é gerar um monstro baseado na descrição do usuário e retornar APENAS um JSON válido.
                Não escreva NENHUM texto antes ou depois do JSON. Não inclua a palavra json no início. Comece diretamente com a chave {.
                O formato deve ser ESTRITAMENTE este:
                {
                  "name": "nome_do_monstro", "cr": 0, "size": "", "type": "", "CA": "", "HP": 0, "speed": "", 
                  "skill": "", "resistances": "", "immunities": "", "senses": "", "languages": "", 
                  "str": 10, "dex": 10, "con": 10, "int": 10, "sab": 10, "car": 10, "traits": "", 
                  "actions": "", "hdurl": ""
                }
                Aqui está a ideia do usuário: \(prompt)
                """
            
            prompt = ""
            isLoading = true
            iaResponse = ""
            
            Task {
                do {
                    let response = try await model.generateContent(userPrompt)
                    
                    guard let textoDaIA = response.text else {
                        iaResponse = "A IA retornou um texto vazio."
                        isLoading = false
                        return
                    }
                    
                    iaResponse = textoDaIA
                    
                    // 1. Limpeza agressiva do texto
                    var textoLimpo = textoDaIA
                        .replacingOccurrences(of: "```json", with: "")
                        .replacingOccurrences(of: "```", with: "")
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    // 2. Extração usando Regex para achar o bloco { ... }
                    // Isso ignora qualquer "Olá, aqui está o monstro:" que a IA possa ter dito antes.
                    if let inicio = textoLimpo.firstIndex(of: "{"),
                       let fim = textoLimpo.lastIndex(of: "}") {
                        textoLimpo = String(textoLimpo[inicio...fim])
                    }
                    
                    // 3. Tenta decodificar
                    if let jsonData = textoLimpo.data(using: .utf8) {
                        do {
                            let monstro = try JSONDecoder().decode(Monstro.self, from: jsonData)
                            await viewModel.addMonstro(novoMonstro: monstro)
                            dismiss()
                        } catch let decodingError {
                            // Se cair aqui, a IA gerou o JSON, mas ele não bate 100% com a sua Struct Monstro.
                            // O erro mostrará exatamente qual campo falhou (ex: mandou String no lugar de Int)
                            iaResponse = "A IA gerou o monstro, mas no formato errado. Erro: \(decodingError.localizedDescription)"
                            print("Erro de Decodificação: \(decodingError)")
                        }
                    } else {
                        iaResponse = "Não foi possível converter o texto para JSON."
                    }
                    
                } catch {
                    iaResponse = "Erro na requisição: \(error.localizedDescription)"
                    print("Erro detalhado: \(error)")
                }
                
                isLoading = false
            }
        }
        }
    
    
    
    
    


#Preview("CreateView") {
    CreateAdvView(viewModel: ViewModel())
}
