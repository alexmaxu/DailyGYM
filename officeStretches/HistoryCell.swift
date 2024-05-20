//
//  HistoryCell.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct HistoryCell: View {
    var body: some View {
        VStack {
            Text("History")
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
    HistoryCell()
}
