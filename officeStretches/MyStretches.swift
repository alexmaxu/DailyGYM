//
//  myStretches.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct MyStretches: View {
    let arrayStretches: [String] = ["Morning Routine", "neck stretch"]
    var body: some View {
        TabView {
            ForEach(arrayStretches, id:\.self) { stretch in
                MyStretchesTitle(image: .ejercise1, title: stretch)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        
        .frame(maxWidth: .infinity)
        .frame(height: 400)
    }
}

#Preview {
    MyStretches()
}
