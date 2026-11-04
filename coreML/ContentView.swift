//
//  ContentView.swift
//  CoreML
//
//  Created by Turma02-19 on 04/11/26.
//

import SwiftUI
import Foundation
import Vision
import CoreML


struct ContentView: View {
    @State var selectedImage = "macaco"
    @State  var classificationLabel = "Pronto pra analisar"
    @State var classificationModel="Mobilenet"
    func classifyImageMobNet() {
        guard let uiImage = UIImage(named: selectedImage),
              let ciImage = CIImage (image: uiImage) else {
            classificationLabel = "Erro ao converter imagem"
            return
        }
        do {
            let model = try VNCoreMLModel(
                for: MobileNetV2(configuration: MLModelConfiguration()).model
            )
            let request = VNCoreMLRequest (model: model) { request, error in
                if let results = request.results as?
                    [VNClassificationObservation],
                   let topResult = results.first {
                    DispatchQueue.main.async {
                        classificationLabel = "\(topResult.identifier) (\(String(format: "%.2f", topResult.confidence * 100))%)"
                    }
                } else {
                    classificationLabel = "Nenhum resultado encontrado"
                }
            }
            let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
            DispatchQueue.global().async {
                do {
                    try handler.perform([request])
                } catch {
                    classificationLabel = "Erro na classificação: \(error.localizedDescription)"
                }
            }
        }catch{
            classificationLabel = "Falha ao carregar modelo ML"
            
        }
    }
    func classifyImageYolo() {
            guard let uiImage = UIImage(named: selectedImage),
                  let ciImage = CIImage(image: uiImage) else {
                classificationLabel = "Erro ao converter imagem"
                return
            }
            
            do {
                
                let model = try VNCoreMLModel(for: YOLOv3(configuration: MLModelConfiguration()).model)
                
                let request = VNCoreMLRequest(model: model) { request, error in
                    
                    if let results = request.results as? [VNRecognizedObjectObservation],
                       let topResult = results.first,
                       let topLabel = topResult.labels.first {
                        
                        DispatchQueue.main.async {
                            classificationLabel = "\(topLabel.identifier) (\(String(format: "%.2f", topLabel.confidence * 100))%)"
                        }
                    } else {
                        DispatchQueue.main.async {
                            classificationLabel = "Nenhum objeto detectado"
                        }
                    }
                }
                
                let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
                DispatchQueue.global().async {
                    do {
                        try handler.perform([request])
                    } catch {
                        DispatchQueue.main.async {
                            classificationLabel = "Erro no YOLO: \(error.localizedDescription)"
                        }
                    }
                }
            } catch {
                classificationLabel = "Falha ao carregar o modelo YOLO"
            }
        }
    
    
    var body: some View {
        ZStack{
            Color.gray
                           .ignoresSafeArea()
            HStack{
                Spacer()
                VStack {
                    Button("\(classificationModel)"){
                        if(classificationModel=="Mobilenet"){
                            classificationModel="yolo"
                        }
                        else if(classificationModel=="yolo"){
                            classificationModel="Mobilenet"
                        }
                    }.frame(width:300, height:50).background(.blue.gradient).tint(.white)
                    Spacer()
                    Text("Identificador de Imagem").font(.system(size: 30))
                    Spacer()
                    Image(selectedImage)
                    
                        .resizable().frame(width:300,height:225)
                        .border(Color.white, width: 3).clipShape(RoundedRectangle(cornerRadius: 7))
                    Spacer()
                    ZStack{
                        
                        Rectangle().fill(.white).frame(width:300, height:50)
                        HStack(){
                            VStack(){
                                Text("Resultado:")
                                
                            Text("\(classificationLabel)")
                                }
                          
                            
                            
                        }}
                    
                    Button("identificar"){
                        if(classificationModel=="Mobilenet"){
                            classifyImageMobNet()
                        }
                        else if(classificationModel=="yolo"){
                            classifyImageYolo()
                        }
                    }.frame(width:300, height:50).background(.blue.gradient).tint(.white)
                }
                .padding()
                
                Spacer()
            }
        }
        }
    }

#Preview {
    ContentView()
}
