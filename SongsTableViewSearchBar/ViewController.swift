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

    //use to represent what the user is searching
    var userQuery = "" {
        //when the property observer that is attached to changes then DidSet gets triggered
        didSet { //trailing closure syntax
            songs = Song.loveSongs.filter{$0.name.lowercased().contains(userQuery.lowercased())}
        }
    }
    //This just grabs the data within the class, because of the static func
    var songs = [Song]() {
        didSet {
            songTableView.reloadData()
        }
    }
    var isSearchBarEmpty: Bool {
        return songSearch.text?.isEmpty ?? true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        songTableView.delegate = self
        songTableView.dataSource = self
        songSearch.delegate = self
        definesPresentationContext = true
    }
    
    func setUp() {
        songs = Song.loveSongs
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        cell.textLabel!.text = songs[indexPath.row].name
        cell.detailTextLabel!.text = songs[indexPath.row].artist
        cell.textLabel?.numberOfLines = 0 // this creates room for the text inside the label/tablecell without it cutting off
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


extension ViewController: UISearchBarDelegate {
    //has a bunch of optional methods in the palm of your hands
    
    //When the user presses the magnify glass or enter
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let updatedUserQuery = searchBar.text else {
            return
        }
        userQuery = updatedUserQuery //Set the value of means equal
        print(userQuery)
    }
    //this is optional chaining
    //        guard !searchBar.text?.isEmpty else {
    //            songs = Song.loveSongs
}
