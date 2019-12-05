//
//  DetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Melinda Diaz on 12/2/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!

    var ex: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setUp()
    }
    
    func setUp() {
        guard let unwrapEx = ex else {
            return
        }
// When you unwrap a variable you need to use it in true town.
        musicTitle.text = unwrapEx.name
        artistLabel.text = unwrapEx.artist
//  this programmatically puts the image in the UIImageView
        songImage.image = UIImage(named: "loveSongs")
    }
    

}
