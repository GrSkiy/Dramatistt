//
//  NextSignUpStageViewController.swift
//  Dramatist
//
//  Created by Gr.Skiy on 17.05.2020.
//  Copyright © 2020 Gr.Skiy. All rights reserved.
//
import Foundation
import UIKit
import Firebase

class NextSignUpStageViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var secondNameTextField: UITextField!
    
    @IBOutlet weak var roleTextField: UITextField!
    
    @IBOutlet weak var createAccount: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    //MARK: - Init
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
    }
        
    //MARK:- Handlers
    
   func validateFields() -> String? {
       
       // Проверка того, чтобы все поля были заполнены
    if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || secondNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || roleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
           return "Please fill in all fields"
       }
       return nil
   }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }


    
    @IBAction func createAccountTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            //Ошибка
            showError(error!)
        } else {
            
            let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            // Данные добавлены базу данных
            /* var db = Firestore.firestore()
            db.collection("users").document("") */
        }

    
    
    
    }
}
