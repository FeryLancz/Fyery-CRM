//
//  CircularProgressBar.swift
//  Fyery
//
//  Created by Fery Lancz on 27.01.23.
//

import SwiftUI

struct CircularProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color.main)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.main)
                .rotationEffect(Angle(degrees: 270.0))
                //.animation(.linear)

//            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
//                .font(.largeTitle)
//                .bold()
//                .foregroundColor(.main)
        }
        .padding(10)
    }
}

struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar(progress: .constant(0.7))
    }
}
