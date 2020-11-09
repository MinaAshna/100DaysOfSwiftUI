//
//  GuessTheFlag.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 09/11/2020.
//

import SwiftUI

enum Countries: Int, CaseIterable {
    case estonia
    case france
    case germany
    case ireland
    case italy
    case monaco
    case nigeria
    case poland
    case russia
    case spain
    case uk
    case us
    
    var name: String {
        switch self {
        case .estonia: return "Estonia"
        case .france: return "France"
        case .germany: return "Germany"
        case .ireland: return "Ireland"
        case .italy: return "Italy"
        case .monaco: return "Monaco"
        case .nigeria: return "Nigeria"
        case .poland: return "Poland"
        case .russia: return "Russia"
        case .spain: return "Spain"
        case .uk: return "UK"
        case .us: return "US"
        }
    }
}

struct GuessTheFlag: View {
    @State private var countries = Countries.allCases.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer].name)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        flagTapped(number)
                    }) {
                        Image(self.countries[number].name)
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                        
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(self.scoreTitle), message: Text("Your score is??"), dismissButton: .default(Text("Countinue")) {
                self.askQuestion()
            })
        }
    }
}

extension GuessTheFlag {
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            self.scoreTitle = "Correct"
        } else {
            self.scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    private func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlag()
    }
}
