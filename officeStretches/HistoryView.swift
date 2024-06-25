//
//  HistoryView.swift
//  officeStretches
//
//  Created by Alex  on 21/6/24.
//

import SwiftUI

struct HistoryView: View {
    @Binding var history: [HistoryModel]
    var body: some View {
        List {
            ForEach(history) { history in
                Section("\(history.day)") {
                    Text(history.title)
                }
            }
            
            
        }
    }
}

#Preview {
    HistoryView(history: .constant(HistoryModel.previewHistoryList))
}
