//
//  SideMenuOptionView.swift
//  Trained
//
//  Created by Boss Man on 22/11/23.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width: 24, height: 24)
            
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
            
            Spacer()
        }
        .padding()
        .foregroundStyle(.white)
    }
}

#Preview {
    SideMenuOptionView(viewModel: .settings)
}
