//
//  SideMenuHeaderView.swift
//  Trained
//
//  Created by Boss Man on 22/11/23.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {
                withAnimation(.spring()) {
                    isShowing.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.white)
                    .padding()
            })
            VStack(alignment: .leading) {
                Image("TrainedLogo")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                    
                
                Text("Total Days Trained")
                    .font(.system(size: 24, weight: .semibold))
                
                HStack{
                    HStack(spacing: 4) {
                        Text("62").bold()
                        Text("Days")
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
        
    }
}

#Preview {
    SideMenuHeaderView(isShowing: .constant(true))
}
