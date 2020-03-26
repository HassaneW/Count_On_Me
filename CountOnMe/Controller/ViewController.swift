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
    
    
    @IBOutlet weak var buttonAddition: UIButton!
    @IBOutlet weak var buttonSoustraction: UIButton!
    @IBOutlet weak var buttonMultiplication: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    
    
    
    
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
    
    // Créer fonction factorisation de tous les operateurs
    
    func operatorFactorization(_ sender: UIButton) {
        
        guard calculator.canAddOperator == true else { return OperatorIsAlreadyOn() }
        
        sender.isSelected = true
        
        switch sender {
        case buttonAddition:
            textView.text.append(" + ")
            calculator.expression = textView.text
            
        case buttonSoustraction:
            
            textView.text.append(" - ")
            calculator.expression = textView.text
            
        case buttonMultiplication:
            
            textView.text.append(" * ")
            calculator.expression = textView.text
            
        case buttonDivision:
            
            textView.text.append(" / ")
            calculator.expression = textView.text
            
        default:
            break
        }
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        
        operatorFactorization(buttonAddition)
        
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        
        operatorFactorization(buttonSoustraction)
    }
    
    
    @IBAction func tappedMultiplication(_ sender: UIButton) {
        
        operatorFactorization(buttonMultiplication)
        
    }
    
    
    @IBAction func tappedDivision(_ sender: UIButton) {
        
        operatorFactorization(buttonDivision)
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
    
    
    func factorisationErrorMessage() {
        
      
        
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
