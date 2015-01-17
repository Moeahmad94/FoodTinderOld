//
//  Restaurant.swift
//  FoodTinder
//
//  Created by Mohammad Ahmad on 17/01/2015.
//  Copyright (c) 2015 Mohammad Ahmad. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    
    var name            :   String!
    var description     :   String!
    var location        :   String!
    var linkToSite      :   String!
    
    
    var profilePicture  :   UIImage!






func setupRestaurant(valDictionary : [String : AnyObject]) {
    for key in valDictionary.keys {
        switch key {
            
        case "name"		:
            if let nm = valDictionary[key] as? String	{
                self.name = nm
            }
            
        case "description"	:
            if let desc = valDictionary[key] as? String	{
                self.description = desc
            }
            
        case "location"	:
            if let loc = valDictionary[key] as? String	{
                self.location = loc
            }
            
        case "linkToSite"	:
			if let link = valDictionary[key] as? String	{
				self.linkToSite = link
			}
			
        default		:
            break
            
        } // end switch
        
        if self.userProfile != nil {
            self.userProfile.setValuesForKeysWithDictionary(valDictionary)
        }
    }
} // end setupGame
	
	
} // end Restaurant Class





















class PickUpPlayer {
    
    private var email		:	String!
    private var name		:	String!
    private var age			:	Int!
    private var sex			:	Sex!
    
    private var userModel	:	PFUser!
    private var userId		:	String!
    private var userProfile	:	PFObject!
    
    var profilePicture		:	UIImage!
    
    var delegate			:	PickUpPlayerDelegate?
    
    private var loggedIn	=	false
    
    init() {
        
    }
    
    init(profileId: String) {
        let query = PFQuery(className: "Player")
        query.whereKey("objectId", equalTo: profileId)
        
        query.findObjectsInBackgroundWithBlock { (objs: [AnyObject]!, err) -> Void in
            if err == nil {
                if let profile = objs[0] as? PFObject {
                    self.userProfile = profile
                    
                    self.getInfoFromProfile()
                }
            }
        }
    }
    
    init(values : [String : AnyObject]) {
        self.setupPlayer(values)
    }
    
    func setupPlayer(valDictionary : [String : AnyObject]) {
        for key in valDictionary.keys {
            switch key {
                
            case "name"	:
                if let nm = valDictionary[key] as? String	{
                    self.name = nm
                }
                
            case "age"	:
                if let ag = valDictionary[key] as? Int		{
                    self.age = ag
                }
                
            case "sex"	:
                if let sx = valDictionary[key] as? String	{
                    self.sex = Sex(rawValue: sx)
                }
                
            default		:
                break
                
            } // end switch
            
            if self.userProfile != nil {
                self.userProfile.setValuesForKeysWithDictionary(valDictionary)
            }
        }
    } // end setupGame
    
    func userLoggedIn(user: PFUser!, values: [String : AnyObject]?) {
        self.userModel = user
        self.loggedIn = true
        
        if let userProfile = user.objectForKey("player") as? PFObject {
            userProfile.fetchIfNeededInBackgroundWithBlock { (obj, err) -> Void in
                if err == nil {
                    self.userProfile = obj
                    
                    self.getInfoFromProfile()
                }
            }
        } else {
            // create a profile and save it
            self.userProfile = PFObject(className: "Player")
            self.setupPlayer(values!)
            
            self.userProfile.saveInBackgroundWithBlock({ (success, err) -> Void in
                if err == nil {
                    self.userModel.setObject(self.userProfile, forKey: "player")
                    self.userModel.saveInBackgroundWithBlock({ (success, err) -> Void in
                        if err == nil {
                            NSLog("Successfully saved new Player object to User.")
                        }
                    })
                }
            })
        }
    }
    
    func getInfoFromProfile() {
        if self.userProfile == nil {
            return
        }
        
        if let pic = self.userProfile.objectForKey("profilePicture") as? PFFile		{
            pic.getDataInBackgroundWithBlock({ (data, err) -> Void in
                if err == nil && data != nil {
                    if let img = UIImage(data: data) as UIImage! {
                        self.profilePicture = img
                        
                        self.delegate?.updatedUserPicture()
                    }
                }
            })
        }
    }
    
    func returnCurrPlayer() -> PFObject {
        return self.userProfile
    }
    
    class var currentUser: PickUpPlayer {
        return _currentUser
    }
    
} // end PickUpPlayer

private let _currentUser: PickUpPlayer = PickUpPlayer()