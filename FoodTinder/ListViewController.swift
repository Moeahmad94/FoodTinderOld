//
//  ListViewController.swift
//  FoodTinder
//
//  Created by Pinak Shikhare on 1/17/15.
//  Copyright (c) 2015 Mohammad Ahmad. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController{

    //    var itemsList = [
    //        ScavengerHuntItem(name: "Cat"),
    //        ScavengerHuntItem(name: "Bird"),
    //        ScavengerHuntItem(name:"Brick")]
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FoodCell", forIndexPath: indexPath) as UITableViewCell;
        
        cell.textLabel!.text = "Hello"
//        
//        let item = itemsManage.items[indexPath.row]
//        
//        if item.isComplete{
//            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
//            cell.imageView!.image = item.photo
//            
//        }else{
//            cell.accessoryType = .None
//            cell.imageView!.image = nil
//        }
//        
        
        return cell;
        
    }
    

//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let imagePicker = UIImagePickerController()
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
//            // if camera exists
//            imagePicker.sourceType = .Camera
//        }
//        else{
//            // else use photolibrary
//            imagePicker.sourceType = .PhotoLibrary
//        }
//        
//        imagePicker.delegate = self
//        presentViewController(imagePicker, animated: true, completion: nil)
//    }
    
    
    
    
    
}