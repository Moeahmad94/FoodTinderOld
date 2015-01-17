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
		
    } // end for key in valDictionary
} // end setupGame
	
	
} // end Restaurant Class

