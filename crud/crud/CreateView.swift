import SwiftUI

struct CreateView: View {
    
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
    
    @State private var mostrarErro = false

    var body: some View {
        NavigationStack {
            Form {
                
                Section(header: Text("Informações Básicas")) {
                    TextField("Nome do Monstro", text: $name)
                    TextField("Tamanho (Ex: Grande)", text: $size)
                    TextField("Tipo (Ex: Besta)", text: $type)
                    TextField("URL da Imagem", text: $hdurl)
                }
                
                Section(header: Text("Combate")) {
                    TextField("HP (Vida) *", text: $hp)
                        .keyboardType(.numberPad) // Teclado numérico
                    
                    TextField("Classe de Armadura (CA)", text: $ca)
                    
                    TextField("Nível de Desafio (CR)", text: $cr)
                        .keyboardType(.numberPad)
                    
                    TextField("Velocidade", text: $speed)
                }
                
                Section(header: Text("Atributos Base (Apenas números) *")) {
                    HStack {
                        TextField("FOR", text: $str).keyboardType(.numberPad)
                        Divider()
                        TextField("DES", text: $dex).keyboardType(.numberPad)
                        Divider()
                        TextField("CON", text: $con).keyboardType(.numberPad)
                    }
                    HStack {
                        TextField("INT", text: $int).keyboardType(.numberPad)
                        Divider()
                        TextField("SAB", text: $sab).keyboardType(.numberPad)
                        Divider()
                        TextField("CAR", text: $car).keyboardType(.numberPad)
                    }
                }
                
                Section(header: Text("Defesas e Sentidos")) {
                    TextField("Resistências", text: $resistances)
                    TextField("Imunidades", text: $immunities)
                    TextField("Sentidos (Ex: Visão no escuro)", text: $senses)
                    TextField("Idiomas", text: $languages)
                    TextField("Perícias", text: $skill)
                }
                
                Section(header: Text("Habilidades")) {
                    TextField("Traços Especiais", text: $traits, axis: .vertical)
                        .lineLimit(3...6)
                    TextField("Ações", text: $actions, axis: .vertical)
                        .lineLimit(3...6)
                }
                
            }
            .navigationTitle("Criar Monstro")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Salvar") {
                        enviarMonstro()
                    }
                    .bold()
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            .alert("Erro de Preenchimento", isPresented: $mostrarErro) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Verifique se os campos marcados com * (como HP e atributos) foram preenchidos apenas com números.")
            }
        }
    }
    
        private func enviarMonstro() {
            // Criamos o objeto Monstro com os dados do formulário
            let novoMonstro = Monstro(
                _id: nil,
                _rev: nil,
                name: name.isEmpty ? nil : name,
                cr: Int(cr), // Tenta converter, se falhar ou estiver vazio vira nil
                size: size.isEmpty ? nil : size,
                type: type.isEmpty ? nil : type,
                CA: ca.isEmpty ? nil : ca,
                HP: Int(hp), // Tenta converter para Int opcional
                speed: speed.isEmpty ? nil : speed,
                skill: skill.isEmpty ? nil : skill,
                resistances: resistances.isEmpty ? nil : resistances,
                immunities: immunities.isEmpty ? nil : immunities,
                senses: senses.isEmpty ? nil : senses,
                languages: languages.isEmpty ? nil : languages,
                str: Int(str),
                dex: Int(dex),
                con: Int(con),
                int: Int(int),
                sab: Int(sab),
                car: Int(car),
                traits: traits.isEmpty ? nil : traits,
                actions: actions.isEmpty ? nil : actions,
                hdurl: hdurl.isEmpty ? nil : hdurl
            )
            
            Task {
                await viewModel.addMonstro(novoMonstro: novoMonstro)
                dismiss()
            }
        }
}


#Preview("CreateView") {
    CreateView(viewModel: ViewModel())
}
