//
//  AdditionView.swift
//  Arithmetic Buddy
//
//  Created by Harshan Dhindsa on 2025-01-18.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    
    // What number the user has guessed
    @State var givenInput = ""
    
    // What number the computer wants the user to guess
    @State var target = Int.random(in: 1...100)
    
    // The two numbers the user must add
    @State var firstNumber = Int.random(in: 1...25)
    @State var secondNumber = Int.random(in: 1...25)
    
    // Feedback to the user
    @State var feedback = ""
    
    // The list of numbers the user has guessed so far
    @State var guessesMade: [Int] = []
    
    // MARK: Computed properties
    
    // The correct sum of the randomly generated numbers
    var correctSum: Int {
        return firstNumber + secondNumber
    }
    
    // The user interface
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            HStack {
                Spacer()
                Text("\(firstNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
            
            HStack {
                Text("+")
                    .font(Font.system(size: 50))
                Spacer()
                Text("\(secondNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
            
            Divider()
            
            TextField("Enter Sum", text: $givenInput)
                .font(Font.system(size: 45))
                .padding(.trailing)
                .multilineTextAlignment(.trailing)
            
            Spacer()
            
            Button {
                checkAnswer()
            } label: {
                Text("Check Answer")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Text(feedback)
                .font(
                    .custom(
                        "Arial",
                        size: 40.0,
                        relativeTo: .title3
                    )
                )
            
            
            Spacer()
            
            Button {
                reset()
            } label: {
                Text("Reset")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
    
    // MARK: Functions
    
    // Check whether the user's answer was correct
    // Provide appropriate feedback
    func checkAnswer() {
        
        // Attempt to unwrap the input provided by the user
        guard let selectedNumber = Int(givenInput) else {
            feedback = "Please provide an integer."
            return
        }
        
        // Provide feedback to the user
        // When should they guess higher?
        // When should then guess lower?
        if correctSum == selectedNumber {
            feedback = "Correct!"
        } else if 1 == 1 {
            feedback = "Incorrect"
        }
            
        
        // Save the user's guesses
        guessesMade.append(selectedNumber)
        
    }
    
    // Reset for a new question
    func reset() {
        
        firstNumber = Int.random(in: 1...25)
        secondNumber = Int.random(in: 1...25)
        feedback = ""
        
        // Start the user back at 50
        // Start the user back with an empty string
        givenInput = ""
        
        // Have the computer guess a new number
        target = Int.random(in: 1...100)
        
        // Reset feedback
        feedback = ""
        
        // Remove guesses made
        guessesMade.removeAll()
        
    }
    
}

#Preview {
    AdditionView()
}

