//
//  ViewController.swift
//  hws_project1
//
//  Created by mojo on 15/04/2020.
//  Copyright © 2020 m. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //declare constant called fm to look for files within the filesystem
        let fm = FileManager.default
        
        //declares a new resource path to find files thats used in the app
        let path = Bundle.main.resourcePath!
        
        //set the contents of the direct of the above line
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            if item.hasPrefix("nssl"){
                // this is a pic to load
                pictures.append(item)
                pictures.sort() //this will sort images in an inferred order ie a to z
            }
        }
        

        
    }
    // How many rows should appear in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    // What each row should look like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    // 1. try loading the vc
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2. set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3. push it on the navigation controller
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    // Array of pics listed in the Content folder
    //var picturesArray = ["nssl0049.jpg", "nssl0046.jpg", "nssl0091.jpg", "nssl0045.jpg", "nssl0051.jpg", "nssl0041.jpg", "nssl0042.jpg", "nssl0043.jpg", "nssl0033.jpg", "nssl0034.jpg"]
    
        
}



