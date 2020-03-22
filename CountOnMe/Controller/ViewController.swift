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
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if calculator.expressionHaveResult {
            textView.text = ""
            calculator.expression = textView.text

        
        }
        
        textView.text.append(numberText)
        calculator.expression = textView.text
    }
    
    
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append(" + ")
            calculator.expression = textView.text
        } else {
            OperatorIsAlreadyOn()
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append(" - ")
            calculator.expression = textView.text
        } else {
            OperatorIsAlreadyOn()
        }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect else {
            
         return enterCorrectExpression()
        }
        
        guard calculator.expressionHaveEnoughElement else {
            
            return startNewCalculation()
        }
        
        let operation = calculator.resolveOperation()
        
        textView.text.append(" = \(operation.first!)")
        calculator.expression = textView.text
    }
    
    private func OperatorIsAlreadyOn() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    private func enterCorrectExpression() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)
        
    }
    
    private func startNewCalculation() {
        
        let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)
        
    }

}

// Créer 2 fonctions pour les messages d'erreurs

// Fonction communication entre textView.text et calculator.expression 
