//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Santosh Gogi on 4/12/17.
//  Copyright © 2017 Home User. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  
    @IBOutlet weak var messageField: UITextField!
    var message: String {
        get {
            return messageField.text ?? ""
        }
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
    
    return cell
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Chat"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendMessage(_ sender: Any) {
        let messageObject = PFObject(className: "Message")
        messageObject["text"] = message
        messageObject["user"] = PFUser.current()?.email

        messageObject.saveInBackground { (success, error) in
            if let error = error {
                let errorString = error.localizedDescription
                print(errorString)
            } else {
                print("message posted")
            }
        }
        

        
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
