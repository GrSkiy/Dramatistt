//
//  SignUpController.swift
//  Dramatist
//
//  Created by Gr.Skiy on 17.05.2020.
//  Copyright © 2020 Gr.Skiy. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase

class SignUpController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var continueSignUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK:- Handlers
    
    func validateFields() -> String? {
        
        // Проверка того, чтобы все поля были заполнены
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        
        // Проверка безопасности пароля
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToNextSignUp() {
        
        let vc = storyboard?.instantiateViewController(identifier: Constants.Storyboard.nextSignUpStageController) as? NextSignUpStageViewController
        
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func ContinueTapped(_ sender: Any) {
        
        let error = validateFields()
        
        
        if error != nil {
            
            //Ошибка
            showError(error!)
        } else {
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Создание пользователя
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
            // Проерка на ошибки
                if err != nil {
                    // Есть ошибка
                    self.showError("Error creating user")
                } else {
                    
                    // Пользователь создан успешно, теперь данные сохранены
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["email": email, "password": password, "uid": result!.user.uid ]) { (err) in
                        
                        if err != nil {
                            // Есть ошибка
                            self.showError("Error saving user data")
                        }
                    }
                    
                    //Переход к главному экрану
                    self.transitionToNextSignUp()
                }
            }
            
        }
        
    }
}
