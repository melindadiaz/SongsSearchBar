//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var songSearch: UISearchBar!
    
    @IBOutlet weak var songTableView: UITableView!
    
    //This just grabs the data within the class, because of the static func
    var songs = Song.loveSongs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTableView.delegate = self
        songTableView.dataSource = self
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") else { return UITableViewCell()}
        
         let info = songs[indexPath.row]
        cell.textLabel!.text = info.artist
        cell.detailTextLabel!.text = info.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController,
        let indexPath = songTableView.indexPathForSelectedRow else {
            return
        }
        detailViewController.navigationItem.title = songs[indexPath.row].artist
        detailViewController.viewTwoSong = [songs[indexPath.row]]
        
        }
    }
    
    

