//
//  VideoLable.swift
//  officeStretches
//
//  Created by Alex  on 13/6/24.
//

import SwiftUI

struct VideoLabel: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .bold()
            .tint(.black)
            .frame(width: 90, height: 40)
            .gradientBackground(opacity1: 0.1, opacity2: 0.7)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    VideoLabel(text: "Video")
}
