//
//  LoginViewController.swift
//  ourSpace1.2
//
//  Created by labuser on 11/19/17.
//  Copyright © 2017 Claire Komyati. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        FirebaseApp.configure()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func editingEmail(_ sender: Any) {
        if emailField.text == "Email"{
            emailField.text = "";
        }
    }
    
    @IBAction func emailEntered(_ sender: Any) {
        if emailField.text == ""{
            emailField.text = "Email";
        }
    }
    
    @IBAction func editingPassword(_ sender: Any) {
        if passwordField.text == "Password"{
            passwordField.text = "";
        }
        passwordField.isSecureTextEntry = true;
    }
    
    @IBAction func passwordEnded(_ sender: Any) {
        if passwordField.text == ""{
            passwordField.text = "Password";
            passwordField.isSecureTextEntry = false;
        }
    }
    
    @IBAction func login(_ sender: Any) {
        if let email = emailField.text{
            if let password = passwordField.text{
                Auth.auth().signIn(withEmail: email, password: password){(user, error) in
                    if let error = error {
                        self.showMessagePrompt(error.localizedDescription)
                        return
                    }
                    [self.performSegue(withIdentifier: "HomeViewController", sender: self)]
                }
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        [self.performSegue(withIdentifier: "SignUpViewController", sender: self)]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
