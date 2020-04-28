//
//  DetailViewController.swift
//  hws_project1
//
//  Created by mojo on 16/04/2020.
//  Copyright © 2020 m. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var pictures = [String]()
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String? //optional string hence the ?
    
    var selectedPictureNumber = 0
    var totalPictures = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "This is image \(selectedImage) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage { //checks and unwraps image then passes to below line to UIImage and load it
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // How many rows should appear in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
        return totalPictures
    }
    
    
}
