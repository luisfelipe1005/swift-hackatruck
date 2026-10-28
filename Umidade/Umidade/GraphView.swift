






import SwiftUI
import Charts


struct GraphView: View {
    
    
    var  umidade: [Int] = []
    
    
    
    
    
    
    
    var body: some View {
        Chart {
            ForEach(Array(umidade.enumerated()), id: \.offset) { index, um in
                BarMark (
                    x: .value( " " , index),
                    y: .value( "Valor" , um)
                )
            }
        }
        .frame(height: 300 )
        .padding()
    }
            
            
            
            
            
            
            
            
            
            
            
        }
    

        #Preview {
            GraphView(umidade:[1,2,3,4,5])}
