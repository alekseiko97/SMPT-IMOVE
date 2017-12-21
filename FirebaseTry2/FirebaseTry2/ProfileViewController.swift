//
//  ProfileViewController.swift
//  FirebaseTry2
//
//  Created by Fhict on 15/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    var handle: AuthStateDidChangeListenerHandle!
    var ref: DatabaseReference!
    
    var id = ""
    
    //MARK: fields
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    
    override func viewDidLoad() {
        handle = Auth.auth().addStateDidChangeListener{(auth, user) in /* ...*/}
        ref = Database.database().reference()
        super.viewDidLoad()
        id = Auth.auth().currentUser!.uid
        if(id == "")
        {
            performSegue(withIdentifier: "Loginsegue", sender: self)
        }
        getuser(ID: id)
    }

    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: buttons
    @IBAction func LogoutButton(_ sender: Any)
    {
        do
        {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError
        {
            print("Error signing out: %@", signOutError)
        }
        performSegue(withIdentifier: "Loginsegue", sender: self)
    }
    
    //MARK: functions
    func getuser(ID id:String!)
    {
        
        
        let user = Auth.auth().currentUser
        if let user = user
        {
        ref.child("users/\(id!)").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            print(value)
            let age = value?["Age"] as? Int ?? 0
            
            self.IDLabel.text = user.uid
            self.NameLabel.text = user.displayName
            self.EmailLabel.text = user.email
            self.AgeLabel.text = String(age)
        })
        {
            (error) in
            print(error.localizedDescription)
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
