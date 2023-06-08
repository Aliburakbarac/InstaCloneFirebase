//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Ali Burak Baraç on 15.10.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var passwordTexr: UITextField!
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordTexr.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordTexr.text!) { authdata, error in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "ToFeedVC", sender: nil)
                }
            }
            
            
        }else{
            
    
            makeAlert(titleInput: "Error!", messageInput: "Username/Password")
            
        }
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordTexr.text != ""{
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordTexr.text!) { authdata, error in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                    
                    
                }else{
                    self.performSegue(withIdentifier: "ToFeedVC", sender: nil)
                }
            }
        }else{
            
            makeAlert(titleInput: "Error!", messageInput: "Username/Password")
            
        }
        
        
        
        
        
    }
    func makeAlert(titleInput:String,messageInput:String){
        let alert = UIAlertController(title: "Error", message: "Username/Password?", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

