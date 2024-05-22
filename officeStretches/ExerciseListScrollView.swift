//
//  ExerciseListScrollView.swift
//  officeStretches
//
//  Created by Alex  on 21/5/24.
//

import SwiftUI

struct ExerciseListScrollView: View {
    let arrayImages: [ImageResource] = [.ejercise1,.ejercise1,.ejercise1,.ejercise1]
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(arrayImages, id:\.self) { card in
                    VStack {
                        Text("Title Exercise")
                            .padding(.top)
                        Image(card)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.bottom, .horizontal])
                    }
                    .background(Color.cyan.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top)
                    
                }
                
            }
            
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ExerciseListScrollView()
}
