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

    private let calculator = CalculatorCountOnMe()
    
   
    
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculator.expression = textView.text
        
         let notificationName = Notification.Name("DataUpdated")
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView), name: notificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(errorDividedByZero), name: Notification.Name("ErrorDividedByZero"), object: nil)
        
    }
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
       
        // guard let numberText = sender.title(for: .normal) else { return }
        // calculator.tappedNumberButton(numberText: numberText)
        
        guard let numberText = sender.title(for: .normal) else { return }
        
        calculator.tappedNumberButton(numberText: numberText)
        
//         textView.text = calculator.expression
        
//        if textView.text == "0" {
//            textView.text = ""
//            calculator.expression = textView.text
//        }
//        if calculator.expressionHaveResult {
//            textView.text = ""
//            calculator.expression = textView.text
//        }
//        textView.text.append(numberText)
//        calculator.expression = textView.text
    }
    
    // operator
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        
//         guard let mathOperator = sender.title(for: .normal) else { return }
//        calculator.tappedOperatorButton(with: mathOperator)
//
//        guard calculator.expressionIsCorrect else {
//            factorisationErrorMessage(messageError: "Enter a correct expression !")
//            return
//        }
//        guard !calculator.expressionHaveResult else {
//            factorisationErrorMessage(messageError: "Select a number")
//            return
//        }
        
        guard let mathOperator = sender.title(for: .normal) else { return }
        calculator.tappedOperatorButton(with: mathOperator)
        
//        sender.isSelected = true
//
//        switch sender.currentTitle {
//        case "+":
//            textView.text.append(" + ")
//            calculator.expression = textView.text
//        case "-":
//            textView.text.append(" - ")
//            calculator.expression = textView.text
//        case "/":
//            textView.text.append(" / ")
//            calculator.expression = textView.text
//        case "x":
//            textView.text.append(" x ")
//            calculator.expression = textView.text
//        default:
//            break
//        }
    }
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        
        
//         errorDividedByZero()
         calculator.tappedEqualButton()
        
//        guard !calculator.expressionDividedByZero else {
//            factorisationErrorMessage(messageError: "Division by Zero impossible: Repeat the operation, please ")
//            reset()
//            return
//        }
//        guard calculator.expressionIsCorrect else {
//            factorisationErrorMessage(messageError: "Enter a correct expression !")
//            return
//        }
//        guard calculator.expressionHaveEnoughElement else {
//            factorisationErrorMessage(messageError: "Not Enough Element !")
//            return
//        }
        
//        textView.text.append(" = \(calculator.resolveOperation())")
//        calculator.expression = textView.text
    }
    
    
    
    private func factorisationErrorMessage(messageError: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: messageError, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    @IBAction func actionReset(_ sender: UIButton) {
        calculator.reset()
       }
//    func reset() {
//        textView.text.removeAll()
//        textView.text = "0"
//        calculator.expression = textView.text
//    }
    
    @objc func updateTextView() {
        textView.text = calculator.expression
    }
    
    @objc func errorDividedByZero() {
        factorisationErrorMessage(messageError: "Division by Zero impossible: Repeat the operation, please ")
        calculator.reset()
        
    }
}
