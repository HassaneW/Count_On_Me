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
    
    @IBAction func actionReset(_ sender: UIButton) {
        
        textView.text.removeAll()
        textView.text = "0"
  
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if let index = textView.text.firstIndex(of: "0") {
            textView.text.remove(at: index)
        }
        
        if calculator.expressionHaveResult {
            textView.text = ""
            calculator.expression = textView.text
            
        }
        
        textView.text.append(numberText)
        calculator.expression = textView.text
    }
    
    
    @IBAction func tappedOperateurButton(_ sender: UIButton) {
        
        guard calculator.canAddOperator == true else {
//            OperatorIsAlreadyOn()
            factorisationErrorMessage(messageError: "Un operateur est déja mis !")
            return
        }
        
        sender.isSelected = true
        
        
        
        // po sender.currentTitle; sender.currentTitle + case ???
        switch sender {
        case buttonAddition:
            
            textView.text.append(" + ")
            calculator.expression = textView.text
            
        case buttonSoustraction:
            
            textView.text.append(" - ")
            calculator.expression = textView.text
            
        case buttonMultiplication:
            
            textView.text.append(" x ")
            calculator.expression = textView.text
            
        case buttonDivision:
            
            textView.text.append(" / ")
            calculator.expression = textView.text
            
        default:
            break
        }
    }
    
    
    //    @IBAction func tappedAdditionButton(_ sender: UIButton) {
    //
    //        operatorFactorization(sender)
    //
    //    }
    //
    //    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
    //
    //        operatorFactorization(sender)
    //    }
    //
    //
    //    @IBAction func tappedMultiplication(_ sender: UIButton) {
    //
    //        operatorFactorization(sender)
    //
    //    }
    //
    //
    //    @IBAction func tappedDivision(_ sender: UIButton) {
    //
    //        operatorFactorization(sender)
    //    }
    //
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect else {
            
            return factorisationErrorMessage(messageError: "Entrez une expression correcte !")
        }
        
        guard calculator.expressionHaveEnoughElement else {
            
            return factorisationErrorMessage(messageError: "Démarrez un nouveau calcul !")
        }
        
        let operation = calculator.resolveOperation()
        
        textView.text.append(" = \(operation.first!)")
        calculator.expression = textView.text
    }
    
    
    func factorisationErrorMessage(messageError: String) {
    
        let alertVC = UIAlertController(title: "Zéro!", message: messageError, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
//    private func OperatorIsAlreadyOn() {
//        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
//        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        self.present(alertVC, animated: true, completion: nil)
//    }
//
//    private func enterCorrectExpression() {
//        let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
//        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        return self.present(alertVC, animated: true, completion: nil)
//
//    }
//
//    private func startNewCalculation() {
//        let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
//        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        return self.present(alertVC, animated: true, completion: nil)
//
//    }
    
}

// Créer 2 fonctions pour les messages d'erreurs

// Fonction communication entre textView.text et calculator.expression 
