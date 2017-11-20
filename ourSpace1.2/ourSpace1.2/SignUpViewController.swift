//
//  SignUpViewController.swift
//  ourSpace1.2
//
//  Created by labuser on 11/19/17.
//  Copyright © 2017 Claire Komyati. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var equalLabel: UILabel!
    
    @IBOutlet weak var secondPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        equalLabel.text = ""
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
        equalLabel.text = ""
    }
    
    @IBAction func passwordEnded(_ sender: Any) {
        if secondPassword.text == ""{
            secondPassword.text = "Password";
            secondPassword.isSecureTextEntry = false;
        }
    }
    
    @IBAction func editingSecondPassword(_ sender: Any) {
        if secondPassword.text == "Re-enter Password"{
            secondPassword.text = "";
        }
        secondPassword.isSecureTextEntry = true;
        equalLabel.text = ""
    }
    @IBAction func secondPasswordEntered(_ sender: Any) {
        if secondPassword.text == ""{
            secondPassword.text = "Re-enter Password";
            secondPassword.isSecureTextEntry = false;
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        if secondPassword.text != passwordField.text{
            equalLabel.text = "Passwords do not match";
        }
        Auth.auth().createUser(withEmail: emailField.text, password: passwordField){ ( user, error) in
            if let error = error {
                self.showMessagePrompt(error.localizedDescription)
                return
            }
            [self .performSegue(withIdentifier: "LoginViewController", sender: self)]
        }
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
