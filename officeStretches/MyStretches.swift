//
//  myStretches.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct MyStretches: View {
    let arrayStretches: [String] = ["My Morning Routine", "My Neck stretch"]
    var body: some View {
        TabView {
            ForEach(arrayStretches, id:\.self) { stretch in
                MyStretchesCard(image: .ejercise1, title: stretch)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        
//        .frame(maxWidth: .infinity)
        .frame(height: 90)
    }
}

#Preview {
    MyStretches()
}
