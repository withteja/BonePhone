//
//  SignupViewController.swift
//  Boneapp
//
//  Created by Sai Teja on 01/03/20.
//  Copyright © 2020 Boneapp. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var Position: UITextField!
    
    @IBOutlet weak var Phone: UITextField!
    
    var ref : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleTextField(Phone)
        Utilities.styleTextField(Position)
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? 
    {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    var uid=""
    
    @IBAction func signUpTapped(_ sender: Any) 
    {
        ref = Database.database().reference()
                // Validate the fields
                let error = validateFields()
                
                if error != nil {
                    
                    // There's something wrong with the fields, show error message
                    showError(error!)
                }
                else {
                    
                    // Create cleaned versions of the data
                    let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let phone = Phone.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let position = Position.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  
        .trimmingCharacters(in:.whitespacesAndNewlines)
                        
                    // Create the user
                    Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                        
                        // Check for errors
                        if err != nil {
                            
                            // There was an error creating the user
                            self.showError("Error creating user")
                        }
                        else {
                            
                    // User was created successfully, now store the first name and last name and other stuff
                            let db = Firestore.firestore()
                            let newdoc = db.collection("users").document(result!.user.uid)
                            newdoc.setData(["firstname":firstName, "lastname":lastName,"email":email, "uid": result!.user.uid,"did": newdoc.documentID,"phone":phone,"position":position ]) { (error) in
                                
                                if error != nil {
                                    // Show error message
                                    self.showError("Error saving user data")
                                }
                            }
                            let key = newdoc.documentID
                            let user = ["firstname": firstName, "lastname": lastName,
                                        "email": email, "uid": result!.user.uid,"did": newdoc.documentID , "phone": phone, "position": position]
//                            let tempuser = User(firstname: firstName, lastname: lastName, email: email, uid: key!, did: key! , phone: phone, position: position)
                            self.ref.child("users").child(newdoc.documentID).setValue(user) { (Error, DatabaseReference) in
                                
                                if Error != nil
                                {
                                    self.showError("Error saving user data")
                                }
                            }
                           
//                            db.collection("users").setData(data: ["firstname":firstName, "lastname":lastName,"email":email, "uid": result!.use ]) { (error) in
//
//                                if error != nil {
//                                    // Show error message
//                                    self.showError("Error saving user data")
//                                }
//                            }
                            
                            // Transition to the home screen
                            self.transitionToHome()
                        }
                        
                    }
                    
                    
                    
                }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var emai=segue.destination as! HomeViewController
//        emai.uid=self.uid
//        //                HomeTransition()
//    }
//    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
       let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
              
              self.view.window?.rootViewController = homeViewController
              self.view.window?.makeKeyAndVisible()
        
       
        
    }
    
}
