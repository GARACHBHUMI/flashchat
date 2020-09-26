//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var popUp: UIView!
    
    @IBOutlet weak var popUpLabel: UILabel!
    override func viewDidLoad() {
                  super.viewDidLoad()
               popUp.layer.cornerRadius = 5
           }
    @IBAction func PopUpButton(_ sender: UIButton) {
        // dissmiss popup
    }
    
    func animateIn(error:String)
    {
       view.self.addSubview(popUp)
        popUp.center = self.view.center
        popUpLabel.text = error
        
        popUp.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUp.alpha = 0
        
        UIView.animate(withDuration: 0.4)
        {
            self.popUp.alpha = 1
            self.popUp.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
         
        if let email = emailTextfield.text,
            let password  = passwordTextfield.text
        {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error
                {
                    print(e.localizedDescription)
                    let err = "The password must be 6 characters long or more."
                    self.animateIn(error:err)
                }
                else
                {
                    //navigate to chat
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                    
                }
            }
            
        }
        
    }
    
}
