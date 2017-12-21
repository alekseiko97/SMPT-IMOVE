//
//  ViewController.swift
//  Firebase try
//
//  Created by Fhict on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController
{
    var ref: DatabaseReference!
    var you = User(Name: "Job", Age: 22, Email: "Job@gmail.com")
    var me: User!
    var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener{(auth, user) in /*...*/}
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        pubish(user: you)
        read()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func regester(_ sender: Any) {
        var Email: String!
        var Password: String!
        Email = mail.text
        Password = pass.text
        print("Email: ", Email, " Password: ", Password)
        Auth.auth().createUser(withEmail: Email, password: Password){(user,error) in /* ...*/}
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    func pubish(user: User)
    {
        self.ref.child("users/\(user.Name)/NickName").setValue(user.NickName)
        self.ref.child("users/\(user.Name)/Age").setValue(user.Age)
        self.ref.child("users/\(user.Name)/Email").setValue(user.Email)
    }
    
    func read()
    {
        ref.child("users").child("Bob").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let userNickName = value?["NickName"] as? String ?? ""
            let userAge = value?["Age"] as? Int ?? 0
            let userEmail = value?["Email"] as? String ?? ""
            //let user = User(username: username)
            self.me = User(Name: userNickName, Age: userAge, Email: userEmail)
            print("user:", self.me.Name)
            print("NickName: ", self.me.NickName)
            print("Age: ", self.me.Age)
            print("Email: ", self.me.Email)
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}

