# Incubyte String Calculator TDD Kata

Welcome to my implementation of the **String Calculator TDD Kata** for the Incubyte assessment. This project demonstrates Test-Driven Development (TDD) practices using Ruby and Minitest.

---

The goal of this kata is to build a simple String Calculator with the following features:

- Add numbers in a string, separated by commas.
- Handle empty strings and single numbers.
- Handle an arbitrary number of numbers.
- Support newlines as separators (`\n`) along with commas.
- Support custom delimiters, defined as `"//[delimiter]\n[numbers]"`.
- Throw exceptions for negative numbers, listing all negatives in the message.

---

- Language: **Ruby**
- Testing framework: **Minitest**
- Project structure:

├── lib/
│ └── string_calculator.rb # Main String Calculator class
└── test/
└── string_calculator_test.rb # Minitest test cases
