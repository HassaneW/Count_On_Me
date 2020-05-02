//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    let calculator = CalculatorCountOnMe()
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculator.expression = textView.text
    }
    @IBAction func actionReset(_ sender: UIButton) {
        textView.text.removeAll()
        textView.text = "0"
        calculator.expression = textView.text
    }
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        if textView.text == "0" {
            textView.text = ""
            calculator.expression = textView.text
        }
        if calculator.expressionHaveResult {
            textView.text = ""
            calculator.expression = textView.text
        }
        textView.text.append(numberText)
        calculator.expression = textView.text
    }
    @IBAction func tappedOperateurButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect else {
            return factorisationErrorMessage(messageError: "Enter a correct expression !")
        }
        guard !calculator.expressionHaveResult else {
            factorisationErrorMessage(messageError: "Select a number")
            return
        }
        sender.isSelected = true
        switch sender.currentTitle {
        case "+":
            textView.text.append(" + ")
            calculator.expression = textView.text
        case "-":
            textView.text.append(" - ")
            calculator.expression = textView.text
        case "/":
            textView.text.append(" / ")
            calculator.expression = textView.text
        case "x":
            textView.text.append(" x ")
            calculator.expression = textView.text
        default:
            break
        }
    }
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard !calculator.expressionDividedByZero else {
            textView.text = "0"
            calculator.expression = textView.text
            return
                factorisationErrorMessage(messageError: "Division by Zero impossible: Repeat the operation, please ")
        }
        guard calculator.expressionIsCorrect else {
            return factorisationErrorMessage(messageError: "Enter a correct expression !")
        }
        guard calculator.expressionHaveEnoughElement else {
            return factorisationErrorMessage(messageError: "Start a new calculation !")
        }
        textView.text.append(" = \(calculator.resolveOperation())")
        calculator.expression = textView.text
    }
    func factorisationErrorMessage(messageError: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: messageError, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
