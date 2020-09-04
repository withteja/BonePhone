
//
//  ScheduleCell.swift
//  Boneapp
//
//  Created by SAI TEJA on 5/25/20.
//  Copyright © 2020 Boneapp. All rights reserved.

import UIKit
import Firebase
class ScheduleCell: UITableViewCell {
    
   
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Position: UILabel!
    @IBOutlet weak var DatePick: UIDatePicker!
    let uid : String = Auth.auth().currentUser!.uid
    var db : DatabaseReference!
    func SetSchedule (schedule: Schedule){
        Image1.image = schedule.image
        Name.text = schedule.Name
        Position.text = schedule.Position
       

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func tapSchedule(_ sender: Any) {
        let calender = Calendar.current
        var now = Date()
        
        
        db.child("users").
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
