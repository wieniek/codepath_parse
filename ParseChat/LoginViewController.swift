//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Wieniek Sliwinski on 4/13/17.
//  Copyright © 2017 Home User. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

  
  @IBOutlet weak var loginField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  var login: String {
    get {
      return loginField.text ?? ""
    }
  }
  
  var password: String {
    get {
      return passwordField.text ?? ""
    }
  }
  
  
  
  @IBAction func signupButton(_ sender: UIButton) {
    
    let user = PFUser()
    user.username = login
    user.password = password
    user.email = login
    
    user.signUpInBackground { (success: Bool, error: Error?) in
      if let error = error {
        let errorString = error.localizedDescription
      } else {
        print("Let's use the app")
        self.performSegue(withIdentifier: "successLogin", sender: self)
      }
    }
    
  }
  
  @IBAction func loginButton(_ sender: UIButton) {
    
    PFUser.logInWithUsername(inBackground: login, password: password) { (user: PFUser?, error: Error?) in
      if user != nil {
        print("Successful login")
        self.performSegue(withIdentifier: "successLogin", sender: self)
      } else {
        print("Error")
      }
    }
    
    
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
