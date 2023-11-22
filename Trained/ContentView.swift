//
//  ContentView.swift
//  Trained
//
//  Created by Boss Man on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var sideMenuIsShowing = false
    var body: some View {
        NavigationView {
            ZStack {
                if sideMenuIsShowing {
                    SideMenuView(isShowing: $sideMenuIsShowing)
                }
                HomeView()
                    .cornerRadius(sideMenuIsShowing ? 20 : 10)
                    .offset(x: sideMenuIsShowing ? 300 : 0, y: sideMenuIsShowing ? 44 : 0)
                    .scaleEffect(sideMenuIsShowing ? 0.8 : 1)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring()) {
                            sideMenuIsShowing.toggle()
                        }
                    }, label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                    }))
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear {
                sideMenuIsShowing = false
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}

struct HomeView: View {
    @State private var isImageVisible = true
    var body: some View {
        ZStack {
            Color(.white)
            VStack {
                HStack {
                    Button("Front") {
                        
                    }
                    Button("Back") {
                        
                    }
                }
                ZStack{
                    Color.gray
                    Image("male-front")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 600)
                    
                    Color.clear
                        .frame(width: 100, height: 50)
                        .contentShape(Circle())
                        .border(Color.red, width: 2)
                        .onTapGesture {
                            isImageVisible.toggle()
                        }
                        .offset(x:0, y:-160)
                    
                    
                    Image("male-chest")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 600)
                        .opacity(isImageVisible ? 1.0 : 0.0)
                        .onTapGesture {
                            isImageVisible.toggle()
                        }
                    
                }
            }
            .padding()
        }
        
    }
}
