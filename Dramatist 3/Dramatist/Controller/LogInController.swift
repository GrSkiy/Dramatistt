//
//  LogInController.swift
//  Dramatist
//
//  Created by Gr.Skiy on 17.05.2020.
//  Copyright © 2020 Gr.Skiy. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class LogInController: UIViewController {    
    //MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var LogInButton: UIButton!
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Handlers
    
    @IBAction func logInTapped(_ sender: Any) {
        
        //Проверка того, чтобы все поля были заполнены
        
        //Создание чистых версий полей ввода
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Вход пользователя
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            
            if err != nil {
                //Вход провален
                self.errorLabel.text = err!.localizedDescription
                self.errorLabel.alpha = 1
            } else {
                let vc = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeController
                
                self.view.window?.rootViewController = vc
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }
    
}
