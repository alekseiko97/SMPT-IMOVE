//
//  ObjectViewController.swift
//  
//
//  Created by Natalya Suslova on 12/01/2018.
//

import Foundation
import UIKit
class ObjectViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   var  selectedrow  = 0
    @IBOutlet weak var object_table_view: UITableView!
    
    @IBOutlet weak var objectExerciseTableView: UITableView!
    var objects : [String] = ["Bench","Tree","Stairs","Frame","Flat ground"]
    var exercises_for_object : [String] = ["Steps up","Push up","Bear crowl","Jump squat","Pull ups"]
    //can be used for segue, not working yet
   /* var bench_exerc : [String] = ["V-sit","Modified push-up","Steps up"]
    var frame: [String] = ["Inverted row", "push ups", "pull ups"]
    var flat: [String] = ["jump squat", "Bear crawl","Crab walk"]
    var stairs : [String] = ["Step up reverse","Triceps","Skater"]
    var tree: [String] = ["Tree plank"]
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        object_table_view.delegate = self
        object_table_view.dataSource = self
        objectExerciseTableView.dataSource = self
        objectExerciseTableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int = 0
        if tableView == self.object_table_view {
            count = objects.count
        }
        if tableView == self.objectExerciseTableView {
            count = exercises_for_object.count
        }
        return count
    }
    
    
     func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        
        if tableView == self.object_table_view {
            cell = tableView.dequeueReusableCell(withIdentifier: "ObjectCell", for: indexPath) as! ObjectObjectTableViewCell
            let object = objects[indexPath.row]
            cell!.textLabel?.text = object
        }
        if tableView == self.objectExerciseTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "objectExercName", for: indexPath) as! ObjectExerciseTableViewCell
            let exerc = exercises_for_object[indexPath.row]
            cell!.textLabel?.text = exerc
        }
        return cell!
        
    }
    
}
