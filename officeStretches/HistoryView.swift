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
        Text("History:")
            .padding(.top)
            .padding()
        List {
            ForEach(history) { history in
                Section("\(history.date)") {
                    DisclosureGroup {
                        ForEach(history.exercises) { exercise in
                            Text(exercise.workOut)
                        }
                    } label: {
                        Text(history.title)
                    }
                }
            }
        }
    }
}

#Preview {
    HistoryView(history: .constant(HistoryModel.previewHistoryList))
}
