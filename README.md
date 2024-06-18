# SwiftCalc

SwiftCalc is a modern and elegant calculator app built with SwiftUI. This app provides basic arithmetic operations in a clean, user-friendly interface, and includes features such as percentage calculations and sign inversion.

## Features

- **Basic Arithmetic Operations**: Perform addition, subtraction, multiplication, and division.
- **Percentage Calculation**: Easily convert numbers to percentages.
- **Sign Inversion**: Toggle the sign of numbers.
- **Clear Function**: Quickly reset the calculator.
- **Decimal Support**: Handle decimal numbers in calculations.
- **User-friendly UI**: A clean and intuitive interface designed with SwiftUI.
- **Responsive Design**: Optimized for both iPhone and iPad screens.

## Technologies Used

- **Swift**: The programming language used to build the app.
- **SwiftUI**: A framework for building the user interface.

## Core Logic

### Button Actions

- **AC**: Clears all inputs and resets the calculator.
- **+/-**: Inverts the sign of the current input number.
- **%**: Converts the current input number to a percentage.
- **Arithmetic Operators (/ x - +)**: Sets the operation and prepares for the next input.
- **=**: Calculates the result based on the current operation and inputs.
- **Decimal Point**: Allows for decimal number input.
- **Number Buttons**: Appends the pressed number to the current input.

### Calculation Logic

- **First Number Storage**: Stores the first number when an operation button is pressed.
- **Second Number Storage**: Stores the second number when the equals button is pressed.
- **Operation Handling**: Performs the arithmetic operation when the equals button is pressed and displays the result.

## Screenshot

<img width="1606" alt="Screenshot 2024-06-18 at 1 35 13 PM" src="https://github.com/shuddha2021/healthy-food-app/assets/81951239/41e1f8a2-56f2-47d1-bc8c-3201b477e570">

<img width="1633" alt="Screenshot 2024-06-18 at 1 35 00 PM" src="https://github.com/shuddha2021/healthy-food-app/assets/81951239/b685c0a6-4624-4997-96c2-ca557846f06e">

## Project Structure

- `ContentView.swift`: The main SwiftUI view containing the user interface and logic.
- `buttonPressed(_:)`: Handles the logic for each button press.
- `calculateResult()`: Performs the calculation based on the current operation and inputs.
- `buttonWidth(_:)` & `buttonHeight()`: Calculate the dimensions of the buttons for a responsive design.
- `buttonColor(_:)`: Determines the color of each button based on its function.

## Getting Started

### Prerequisites

- **Xcode**: Ensure you have Xcode installed on your Mac.

### Installation

1. Clone the repository.
   ```bash
   git clone https://github.com/yourusername/swiftcalc.git

2. Open the project in Xcode
   ```cd swiftcalc
      cd swiftcalc
      open SwiftCalc.xcodeproj

### Running the Application

1. Select the target device (iPhone or iPad) in Xcode.
2. Click the Run button (or press Cmd+R) to build and run the app on the selected device or simulator.

### Why This Project Is Useful

This project serves as a practical example of building a calculator app using SwiftUI, demonstrating the use of state management, UI design, and basic arithmetic operations in a mobile application. It provides a solid foundation for anyone looking to learn or improve their skills in iOS development with Swift and SwiftUI.

### Contributing

Contributions to this project are welcome. Please fork the repository and create a pull request with your changes.

### License

This project is licensed under the MIT License.
