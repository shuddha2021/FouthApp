import SwiftUI

enum CalculatorOperation {
    case none, add, subtract, multiply, divide
}

struct ContentView: View {
    @State private var input = ""
    @State private var result = ""
    @State private var operation: CalculatorOperation = .none
    @State private var firstNumber = 0.0
    @State private var secondNumber = 0.0
    
    let buttons = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Text(input.isEmpty ? result : input)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                }
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                self.buttonPressed(button)
                                self.provideHapticFeedback()
                            }, label: {
                                Text(button)
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .frame(width: self.buttonWidth(button), height: self.buttonHeight())
                                    .background(self.buttonColor(button))
                                    .cornerRadius(self.buttonWidth(button) / 2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
            .padding()
        }
    }
    
    func buttonPressed(_ button: String) {
        switch button {
        case "AC":
            clearAll()
        case "+/-":
            toggleSign()
        case "%":
            applyPercentage()
        case "/":
            setOperation(.divide)
        case "x":
            setOperation(.multiply)
        case "-":
            setOperation(.subtract)
        case "+":
            setOperation(.add)
        case "=":
            if let number = Double(input) {
                secondNumber = number
                calculateResult()
                input = result
            }
        case ".":
            if !input.contains(".") {
                input += "."
            }
        default:
            input += button
        }
    }
    
    func setOperation(_ operation: CalculatorOperation) {
        if let number = Double(input) {
            firstNumber = number
            self.operation = operation
            input = ""
            result = "\(number) \(operationSymbol(operation))"
        }
    }
    
    func calculateResult() {
        var calculationResult: Double = 0.0
        
        switch operation {
        case .divide:
            if secondNumber != 0 {
                calculationResult = firstNumber / secondNumber
            } else {
                result = "Error"
                return
            }
        case .multiply:
            calculationResult = firstNumber * secondNumber
        case .subtract:
            calculationResult = firstNumber - secondNumber
        case .add:
            calculationResult = firstNumber + secondNumber
        case .none:
            return
        }
        
        result = String(format: "%.2f", calculationResult)
        clearAll(keepResult: true)
    }
    
    func toggleSign() {
        if let number = Double(input) {
            input = String(-number)
        }
    }
    
    func applyPercentage() {
        if let number = Double(input) {
            input = String(number / 100)
        }
    }
    
    func clearAll(keepResult: Bool = false) {
        input = ""
        operation = .none
        firstNumber = 0.0
        secondNumber = 0.0
        if !keepResult {
            result = ""
        }
    }
    
    func operationSymbol(_ operation: CalculatorOperation) -> String {
        switch operation {
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "x"
        case .divide: return "/"
        case .none: return ""
        }
    }
    
    func buttonWidth(_ button: String) -> CGFloat {
        return button == "0" ? (UIScreen.main.bounds.width - (5 * 12)) / 2 : (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonColor(_ button: String) -> Color {
        switch button {
        case "AC", "+/-", "%":
            return Color.yellow.opacity(0.8)
        case "/", "x", "-", "+", "=":
            return Color.green.opacity(0.8)
        default:
            return Color.white.opacity(0.8)
        }
    }
    
    func provideHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
