//
//  ContentView.swift
//  FlagGuessing
//
//  Created by JimmyChao on 2024/3/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var round = 0
    @State private var scoreMessage = ""
    
    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US"
    ]
    
    @State private var randomIndex = Int.random(in: 0...2)
    
    // UI
    struct FlagView: View {
        
        let country: String
        
        var body: some View {
            Image(country)
                .clipShape(.rect(cornerRadius: 15))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
    
    // Modifier

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue, .black],
                startPoint: .top,
                endPoint: .bottom)
            
            VStack(spacing: 30) {
                
                // Top vstack
                Text("Guess the Flag")
                    // .font(.largeTitle.weight(.bold))
                    .customTitle()
                    .foregroundStyle(.white)
                
                // Middle vstack
                VStack {
                    Text("Tap the flag")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.white)
                    
                    Text(countries[randomIndex])
                        .font(.largeTitle.weight(.semibold))
                        .foregroundStyle(.secondary)
                    
                    VStack(spacing: 30) {
                        
                        ForEach(0..<3) { index in
                            Button {
                                flagTapped(number: index)
                            } label: {

                                FlagView(country: countries[index])

                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding()
                }
                
                // Button of outter vstack
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
        }
        .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showingAlert) {
            Button("Continue", action: askQuestions)
        } message: {
            Text("""
                 \(scoreMessage) \n
                 Your score is \(score) \n
                 """)
        }
    }
    
    // MARK: - Functions -
    func shouldRestart(restartAt targetRound: Int) {
        if round > targetRound {
            scoreTitle = "Game Over"
            scoreMessage = "Your final score is \(score)"
            round = 0
            showingAlert = true
        } else {
            showingAlert = false
        }
    }
    
    func flagTapped(number: Int) {
        if number == randomIndex {
            scoreMessage = "That is indeed \(countries[randomIndex])"
            scoreTitle = "Correct"
            score += 1
            
        } else {
            scoreMessage = "That's \(countries[number])"
            scoreTitle = "Wrong"
            score -= 1
        }
        
        // Check new round
        shouldRestart(restartAt: 7)
        showingAlert = true
        round += 1
    }
    
    func askQuestions() {
        countries.shuffle()
        randomIndex = Int.random(in: 0..<3)
    }
    
}

#Preview {
    ContentView()
}
