//
//  LoginViewController.swift
//  Boneapp
//
//  Created by Sai Teja on 24/02/20.
//  Copyright © 2020 Boneapp. All rights reserved.
//

import UIKit
import FirebaseAuth
import TwilioVideo

// the main login text fileds and buttons are added in the main file

class LoginViewController: UIViewController {
    
    
    @IBOutlet var EmailField: UITextField!
    
    @IBOutlet var PasswordField: UITextField!
    @IBOutlet var LoginButton: UIButton!
    @IBOutlet var ErrorField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
//     let   uid = Auth.auth().currentUser!.uid
    var success=false
  
    @IBAction func login(_ sender: Any) 
    {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = EmailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.ErrorField.text = error!.localizedDescription
                self.ErrorField.alpha = 1
            }
            else {
        
        
//                 if the login is successfull
        
                self.success=true;
 
        
                // passing the data between the view controllers
                if(!(self.EmailField.text!.isEmpty)){
                self.performSegue(withIdentifier: "WelSeg", sender: self)
                }
               

            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var emai=segue.destination as! HomeViewController
//        emai.uid=uid
//                HomeTransition()
    }
    func locate (){
        // the main fucntinn
    }
    func HomeTransition(){
        
        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
        
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
