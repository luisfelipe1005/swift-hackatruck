import SwiftUI
import Vision
import AVFoundation
import PhotosUI

struct ContentView: View {
    @State private var photoPicked: PhotosPickerItem? = nil
    @State private var imageToAnalise: UIImage? = nil
    
    @State private var detectedText: String = ""
    
    @State private var mostrartexto: Bool = false
    
    let sintetizador = AVSpeechSynthesizer()
    
    func detectText(photo: UIImage?) {
            guard let image = photo, let cgImage = image.cgImage else {
                detectedText = "Erro ao carregar imagem."
                return
            }
            
            
           
            let request = VNRecognizeTextRequest { request, error in
                guard let observations = request.results as? [VNRecognizedTextObservation], error == nil else {
                    DispatchQueue.main.async {
                        detectedText = "Nenhum texto detectado ou erro na leitura."
                    }
                    return
                }
                
              
                let textoExtraido = observations.compactMap { observation in
                    observation.topCandidates(1).first?.string
                }.joined(separator: "\n")
                DispatchQueue.main.async {
                    if textoExtraido.isEmpty {
                        detectedText = "A imagem não contém texto legível."
                    } else {
                        detectedText = textoExtraido
                    }
                }
            }
            
            request.recognitionLevel = .accurate
            request.usesLanguageCorrection = true
            request.recognitionLanguages = ["pt-BR", "en-US"]
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    try handler.perform([request])
                } catch {
                    DispatchQueue.main.async {
                        detectedText = "Falha ao executar OCR: \(error.localizedDescription)"
                    }
                }
            }
        }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Study cast")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top)
                }
                
                Spacer()
                
                if let uiImage = imageToAnalise {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .cornerRadius(10)
                } else {
                    Text("Nenhuma foto selecionada")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                if(mostrartexto &&   !(detectedText == "")){
                    Text("\(detectedText)").foregroundColor(.white)
                }
                
                if imageToAnalise != nil {
                    Button(action: {
                        print("Identificar texto apertado")
                        detectText(photo: imageToAnalise)
                        mostrartexto = true
                    }) {
                        Text("Identificar Texto")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.blue.gradient)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        detectText(photo: imageToAnalise)
                        let enunciado = AVSpeechUtterance(string: detectedText)
                        
                        enunciado.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        enunciado.rate = 0.45
                        sintetizador.speak(enunciado)
                    }) {
                        Text("Escutar Texto")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.indigo.gradient)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                }
                
              
                PhotosPicker(selection: $photoPicked,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Text("Pegar da Galeria")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo)
                        .foregroundStyle(.white)
                        .cornerRadius(25)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                }
                .onChange(of: photoPicked) { oldValue, newValue in
                    if let newPhoto = newValue {
                        Task {
                            if let data = try? await newPhoto.loadTransferable(type: Data.self),
                               let image = UIImage(data: data) {
                                
                                imageToAnalise = image
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
