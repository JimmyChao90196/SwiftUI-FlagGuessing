//
//  ContentView.swift
//  FlagGuessing
//
//  Created by JimmyChao on 2024/3/10.
//

import SwiftUI

struct ContentView: View {
    
    let gradA = LinearGradient(colors: [.red, .green], startPoint: .bottom, endPoint: .top)
    let gradB = LinearGradient(
        stops: [
            Gradient.Stop(color: .red, location: 0.1),
            Gradient.Stop(color: .blue, location: 0.9)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    let gradC = LinearGradient(
        stops: [
            .init(color: .yellow, location: 0.1),
            .init(color: .cyan, location: 0.9)],
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
    
    let gradD = RadialGradient(
        colors: [.brown, .purple],
        center: .center,
        startRadius: 20,
        endRadius: 330)
    
    let gradE = AngularGradient(colors: [.green, .white, .green], center: .center)
    
    
    var body: some View {
        ZStack {
            VStack {
                gradE
                gradB
                gradD
            }
            
            Color.green
                .frame(
                    width: 300,
                    height: 200,
                    alignment: .center)
                .border(.blue, width: 10)
            
            VStack {
                Button("Button01", role: .none) { }.buttonStyle(.borderedProminent)
                Button("Button01", role: .destructive) { }.buttonStyle(.borderedProminent)
                Button("Button01", role: .cancel) { }.buttonStyle(.bordered)
                
                // Totally customize button
                Button {
                    print("Print Something")
                } label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        .padding(10)
                        .foregroundStyle(.black)
                        .background(.blue)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                }
                
                Button {
                    print("Edit button was tapped")
                } label: {
                    Label("Edit", systemImage: "pencil")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                }
                
                Button("Edit", systemImage: "pencil") {
                    print("Edit button was tapped")
                }.tint(.black)
            }
            
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
