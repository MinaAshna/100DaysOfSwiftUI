//
//  Niklas.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 11/14/20.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var isSelected = false
    @Published var title = "Hello"
}

struct MyButton: View {
    
    var text: String
    @Binding var isSelected: Bool
    var action: () -> ()
    
    var body: some View {
        Button(action: {
                isSelected.toggle()
                action()
        }, label: {
            Text("Placeholder")
        })
        .buttonStyle(MyButtonStyle(
                        label: text,
                        isSelected: isSelected))
    }
}

struct MyButtonStyle: ButtonStyle {
    
    var label: String
    var isSelected: Bool
    
    init(
        label: String,
        isSelected: Bool = false
    ) {
        self.label = label
        self.isSelected = isSelected
    }
    
    func backgroundColor(isPressed: Bool) -> Color {
        print("\(self.label): isPressed? \(isPressed ? "Y" : "N") isSelected? \(self.isSelected ? "Y" : "N")")
        
        if isPressed {
            return Color.myOrange.opacity(0.7)
        } else {
            if isSelected {
                return Color.myOrange
            } else {
                return Color.myWhite
            }
        }
    }
    
    func accentColor(isPressed: Bool) -> Color {
        if isPressed {
            return Color.myWhite.opacity(0.7)
        } else {
            if isSelected {
                return Color.myWhite
            } else {
                return Color.myBlack
            }
        }
    }
    
    func makeLabel(isPressed: Bool) -> some View {
        VStack {
            Spacer()
            Text(label)
                .font(.system(size: 14.0))
                .foregroundColor(accentColor(isPressed: isPressed))
            Spacer()
        }
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let shadowColor = Color.black.opacity(0.1)
        
        return makeLabel(isPressed: configuration.isPressed)
            .frame(width: 100, height: 100)
            .background(backgroundColor(isPressed: configuration.isPressed))
            // .animation(.easeInOut)
            .accentColor(accentColor(isPressed: configuration.isPressed))
            .shadow(color: shadowColor, radius: 24, x: 0, y: 0)
            .shadow(color: shadowColor, radius: 8, x: 0, y: 4)
    }
}

struct Niklas: View {
    
    @ObservedObject var viewModel: ViewModel
    let eventHandler: EventHandler
    
    init() {
        let viewModel = ViewModel()
        self.viewModel = viewModel
        self.eventHandler = EventHandler(viewModel: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            MyButton(
                text: viewModel.title,
                isSelected: $viewModel.isSelected,
                action: eventHandler.didTap
            )
            
            Spacer()
        }
    }
}

class EventHandler {
    
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func didTap() {
        print("Did tap")
    }
}

extension Color {
    static let myOrange: Color = Color(red: 0.91, green: 0.44, blue: 0.12, opacity: 1.0)
    static let myWhite: Color = Color.white
    static let myBlack: Color = Color.black
    
}



struct Niklas_Previews: PreviewProvider {
    static var previews: some View {
        Niklas()
    }
}
