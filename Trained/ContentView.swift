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
                        .gesture(
                            DragGesture()
                                .onEnded { gesture in
                                    if gesture.translation.width < -100 {
                                        withAnimation {
                                            sideMenuIsShowing = false
                                        }
                                    }
                                }
                        )
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
                    .onTapGesture {
                        withAnimation(.spring()){
                            sideMenuIsShowing = false
                        }
                    }
            }
            .gesture(
                DragGesture()
                    .onEnded { gesture in
                        if gesture.translation.width > 100 {
                            withAnimation(.spring) {
                                sideMenuIsShowing = true
                            }
                        }
                    }
                )
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
    @State private var isFrontVisible = true
    
    @State var mainImageHeight: CGFloat = 700
    @State var mainImageWidth: CGFloat = 300
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack {
                Divider()
                HStack {
                    Button(action: {
                        isFrontVisible = true
                    }) {
                        HStack{
                            Spacer()
                            Text("Front")
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                                .bold()
                            Spacer()
                        }
                        .background(Color("MainColor"))
                        .cornerRadius(10)
                        
                    }
                    .contentShape(Rectangle())
                    
                    Spacer()
                    
                    Button(action: {
                        isFrontVisible = false
                    }) {
                        HStack{
                            Spacer()
                            Text("Back")
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                                .bold()
                            Spacer()
                        }
                        .background(Color("MainColor"))
                        .cornerRadius(10)
                        
                    }
                    .contentShape(Rectangle())
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                if isFrontVisible {
                    FrontView(isImageVisible: $isImageVisible, mainImageHeight: $mainImageHeight, mainImageWidth: $mainImageWidth)
                } else {
                    BackView(isImageVisible: $isImageVisible, mainImageHeight: $mainImageHeight, mainImageWidth: $mainImageWidth)
                }
//                BackView(isImageVisible: $isImageVisible)
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        
    }
}

struct FrontView: View {
    @Binding var isImageVisible: Bool
    @Binding var mainImageHeight: CGFloat
    @Binding var mainImageWidth: CGFloat
    var body: some View {
        ZStack{
            
            Image("male-front")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: mainImageWidth, height: mainImageHeight)
                .offset(x: 0, y: 0)

            Image("male-front-chest")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: mainImageWidth, height: mainImageHeight)
                .opacity(isImageVisible ? 1.0 : 0.0)
            
            Color.clear
                .frame(width: 130, height: 60)
                .contentShape(Rectangle())
                .border(Color.red, width: 2)
                .onTapGesture {
                    isImageVisible.toggle()
                }
                .offset(x:0, y:-185)
            
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
}

struct BackView: View {
    @Binding var isImageVisible: Bool
    @Binding var mainImageHeight: CGFloat
    @Binding var mainImageWidth: CGFloat
    
    var body: some View {
        ZStack{
    
            Image("male-back")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: mainImageWidth, height: mainImageHeight)
            
            Image("male-back-lats")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: mainImageWidth, height: mainImageHeight)
                .opacity(isImageVisible ? 1.0 : 0.0)
                
            Color.clear
                .frame(width: 40, height: 120)
                .contentShape(Rectangle())
                .border(Color.red, width: 2)
                .onTapGesture {
                    isImageVisible.toggle()
                }
                .offset(x:-45, y:-125)
            
            Color.clear
                .frame(width: 40, height: 120)
                .contentShape(Rectangle())
                .border(Color.red, width: 2)
                .onTapGesture {
                    isImageVisible.toggle()
                }
                .offset(x:45, y:-125)
            
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
}
