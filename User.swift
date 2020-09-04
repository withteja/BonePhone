//
//  User.swift
//  Boneapp
//
//  Created by SAI TEJA on 5/28/20.
//  Copyright © 2020 Boneapp. All rights reserved.
//

import Foundation
class User {
    var user : [Any] = []
    var firstname : String
    var lastname : String
    var email : String
    var uid : String
    var did : String
    var phone : String
    var position : String
    var avail : Bool
    init (firstname : String , lastname : String , email : String , uid : String,
          did: String ,phone : String , position : String,avail : Bool){
        self.did = did
        self.email = email
        self.firstname = firstname
        self.lastname = lastname
        self.phone = phone
        self.position = position
        self.uid = uid
        self.avail = avail
        user.append(firstname)
        user.append(lastname)
        user.append(email)
        user.append(phone)
        user.append(position)
        user.append(uid)
        user.append(did)
        user.append(avail)
    }
}
