import SwiftUI

struct ContentView: View {
    @State var content: String = ""
    
    var body: some View {
        NavigationStack {
                TextField("Insira", text: $content)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder) 
                HStack {
                    NavigationLink(destination: ShowView(cor: "pink", icon: "paintbrush", text: content)) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.pink)
                            .frame(width: 150, height: 150)
                            .overlay(
                                Image(systemName: "paintbrush")
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                                    .foregroundColor(.white)
                            )
                    }
                    
                    NavigationLink(destination: ShowView(cor: "blue", icon: "paintbrush.pointed", text: content)) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.blue)
                            .frame(width: 150, height: 150)
                            .overlay(
                                Image(systemName: "paintbrush.pointed")
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                                    .foregroundColor(.white)
                            )
                    }
                }
                
                HStack {
                    NavigationLink(destination: ShowView(cor: "gray", icon: "paintpalette", text: content)) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray)
                            .frame(width: 150, height: 150)
                            .overlay(
                                Image(systemName: "paintpalette")
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                                    .foregroundColor(.white)
                            )
                    }
                    
                    NavigationLink(destination: ShowView(cor: "purple", icon: "list.bullet", text: content)) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.purple)
                            .frame(width: 150, height: 150)
                            .overlay(
                                Image(systemName: "list.bullet")
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                                    .foregroundColor(.white)
                            )
                    
                }
            }
            .navigationTitle("List")
        }
    }
}

#Preview("ContentView") {
    ContentView()
}
