//
//  CalculatorView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.08.2024.
//

import SwiftUI

struct CalculatorView: View {
    enum OperationType: CaseIterable {
        case add
        case subtract
        case multiply
        case divide
        
        var text: String {
            switch self {
            case .add:
                return "+"
            case .subtract:
                return "-"
            case .multiply:
                return "*"
            case .divide:
                return "/"
            }
        }
    }
    
    // MARK: - Property Wrappers
    
    @State private var display: String = ""
    @State private var operand1: Double = 0
    @State private var operand2: Double = 0
    @State private var operation: OperationType?
    
    // MARK: - Properties
    
    private let calculator = Calculator()
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            displayTextField
            operationButtons
            resultButton
        }
        .padding()
    }
}

// MARK: - UI Properties

private extension CalculatorView {
    @ViewBuilder
    var displayTextField: some View {
        TextField("0", text: $display)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
    }
    
    @ViewBuilder
    var operationButtons: some View {
        HStack {
            ForEach(OperationType.allCases, id: \.self) { type in
                Button(
                    action: { performOperation(type) }
                ) {
                    Text(type.text)
                }
                .buttonStyle(CalculatorButtonStyle())
            }
        }
    }
    
    @ViewBuilder
    var resultButton: some View {
        Button(
            action: { calculateResult() }
        ) {
            Text("=")
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .frame(height: 44)
        .padding()
    }
}

// MARK: - Private methods

private extension CalculatorView {
    func performOperation(_ operation: OperationType) {
        guard let value = Double(display)
        else {
            return
        }
        
        operand1 = value
        display = ""
        self.operation = operation
    }
    
    func calculateResult() {
        guard
            let value = Double(display),
            let operation
        else {
            return
        }
        
        operand2 = value
        var result: Double = 0
        
        switch operation {
        case .add:
            result = calculator.add(operand1, operand2)
        case .subtract:
            result = calculator.subtract(operand1, operand2)
        case .multiply:
            result = calculator.multiply(operand1, operand2)
        case .divide:
            result = calculator.divide(operand1, operand2)
        }
        
        display = "\(Int(result))"
    }
}

// MARK: - Preview

#Preview {
    CalculatorView()
}
