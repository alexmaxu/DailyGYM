//
//  HistoryCell.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct TitleRow: View {
    let title: String
    let gradientOpacity: Double
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .gradientBackground(opacity1: 0.1, opacity2: gradientOpacity)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}

#Preview {
    TitleRow(title: "Title", gradientOpacity: 0.4)
}
