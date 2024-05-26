//
//  HistoryCell.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct TitleRow: View {
    let title: String
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(.cyan.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}

#Preview {
    TitleRow(title: "Title")
}
