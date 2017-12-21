//
//  ViewController.swift
//  FirebaseTry2
//
//  Created by Fhict on 15/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    var handle: AuthStateDidChangeListenerHandle!
    
    //MARK: fields
    @IBOutlet var NameField: UITextField!
    @IBOutlet weak var AgeField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var PasswordCheckField: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    

    override func viewDidLoad() {
        ref = Database.database().reference()
        handle = Auth.auth().addStateDidChangeListener{(auth, user) in /* ...*/}
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: buttons
    @IBAction func LoginButton(_ sender: Any)
    {
        Auth.auth().signIn(withEmail: EmailField.text!, password: PasswordField.text!)
        {
            (user,error) in
            if let error = error
            {
                self.ErrorLabel.text = error.localizedDescription
            }
            if let user = user
            {
                self.performSegue(withIdentifier: "ProfileSegue", sender: self)
            }
        }
    }
    
    @IBAction func RegisterButton(_ sender: Any)
    {
        let name = NameField.text!
        let age = Int(AgeField.text!)
        let email = EmailField.text!
        let password = PasswordField.text!
        
        if(password != PasswordCheckField.text)
        {
            ErrorLabel.text = "PasswordCheck must be the same as Password"
        }
        else
        {
            Auth.auth().createUser(withEmail: email, password: password)
            {
                (user, error) in
                if let user = user
                {
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = name
                    changeRequest.commitChanges
                        {
                            (error) in
                            if let error = error
                            {
                                self.ErrorLabel.text = error.localizedDescription
                            }
                    self.publish(UserId: user.uid, Name: name, Age: age, Email: email)
                    self.performSegue(withIdentifier: "ProfileSegue", sender: self)
                    }
                }
                if let error = error
                {
                    self.ErrorLabel.text = error.localizedDescription
                }
            }
        }
    }
    
    //MARK: functions
    func publish(UserId id:String!, Name name:String!, Age age:Int!, Email email:String!)
    {
        self.ref.child("users/\(id!)").child("Name").setValue(name)
        self.ref.child("users/\(id!)").child("Age").setValue(age)
        self.ref.child("users/\(id!)").child("Email").setValue(email)
    }
    
}

