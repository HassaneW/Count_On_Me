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
        
        guard let numberText = sender.title(for: .normal) else { return }
        calculator.tappedNumberButton(numberText: numberText)
    }
    
    // operator
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        
        guard let mathOperator = sender.title(for: .normal) else { return }
        calculator.tappedOperatorButton(with: mathOperator)
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        
        calculator.tappedEqualButton()
    }
    
    private func factorisationErrorMessage(messageError: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: messageError, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func actionReset(_ sender: UIButton) {
        calculator.reset()
    }
    
    @objc func updateTextView() {
        textView.text = calculator.expression
    }
    
    @objc func errorDividedByZero() {
        factorisationErrorMessage(messageError: "Division by Zero impossible: Repeat the operation, please ")
        calculator.reset()
    }
}
