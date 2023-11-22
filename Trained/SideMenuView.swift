//
//  SideMenuView.swift
//  Trained
//
//  Created by Boss Man on 22/11/23.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("MainColor"), Color("SecondaryColor")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                // header
                SideMenuHeaderView(isShowing: $isShowing)
                    .foregroundStyle(.white)
                    .frame(height: 180)
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    NavigationLink(destination: Text(option.title), label: {
                        SideMenuOptionView(viewModel: option)
                    })

                }
                
                Spacer()
            }.toolbar(.hidden)
        }
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true))
}
