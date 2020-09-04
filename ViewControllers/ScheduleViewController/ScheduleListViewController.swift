//
//  ScheduleListViewController.swift
//  Boneapp
//
//  Created by SAI TEJA on 5/25/20.
//  Copyright © 2020 Boneapp. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

protocol ScheduledidTapped {
    func ScheduleDidTapp(uid : String)

}

class ScheduleListViewController:UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    var ScheduleArray  = [Schedule]()
    var db : DatabaseReference!
    var TempArray : [Schedule] = []
//    func CreateArray() -> [Schedule] {
//
//
//
//
//
//        return TempArray
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
       db = Database.database().reference()
        db.child("users").observe(DataEventType.value , with: { (DataSnapshot) in
    
            if DataSnapshot.childrenCount > 0 {
            for i in DataSnapshot.children.allObjects as! [DataSnapshot]{
                let data = i.value as? [String : AnyObject]
                let user = Schedule(image: #imageLiteral(resourceName: "image1"), Name: data?["firstname"] as! String, Position: data?["position"] as! String)
                self.ScheduleArray.append(user)
                print(user.Name,user.Position)
                }
                self.TableView.reloadData()
                
            }
//            self.ScheduleArray.append(Schedule(image: #imageLiteral(resourceName: "image1"), Name: "name", Position: "tejs"))
        })
        for i in ScheduleArray {
            print("array is \(i.Name)")
        }
        
        TableView.delegate = self
        TableView.dataSource = self
        // Do any additional setup after loading the view.
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

extension ScheduleListViewController: UITableViewDataSource, UITableViewDelegate{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          print("the count is \(self.ScheduleArray.count)")
        return ScheduleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ScheduleArr = ScheduleArray[indexPath.row]
        print("priniting the index path")
        print("Index path is\(ScheduleArray[indexPath.row].Name)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell") as! ScheduleCell
        cell.SetSchedule(schedule: ScheduleArr)
        print("cell name is \(String(describing: cell.Name))")
        return cell
    }
}
