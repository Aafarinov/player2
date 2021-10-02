//
//  ViewController.swift
//  Player2
//
//  Created by Ryan Boyd on 21.09.2021.
//  Copyright © 2021 Anatolii Afarinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
}

    func configureSongs() {
        songs.append(Song(name: "blue",
                          albumName: "123 Something",
                          artistName: "Eifel-65",
                          imageName: "cover1",
                          trackName: "blue"))
        songs.append(Song(name: "austronaut",
                          albumName: "In the Ocean!",
                          artistName: "Just a song",
                          imageName: "cover2",
                          trackName: "austronaut"))
        songs.append(Song(name: "shallow",
                          albumName: "13 Something",
                          artistName: "Lady Gaga",
                          imageName: "cover3",
                          trackName: "shallow"))
        songs.append(Song(name: "sia",
                          albumName: "12 Something",
                          artistName: "Sia-Sia",
                          imageName: "cover4",
                          trackName: "sia"))
        
       
    }
    
// Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
    cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica-Bold", size: 17)

        return cell
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    tableView.deselectRow(at: indexPath, animated: true)
    
            
            // present the player
            
            let position = indexPath.row
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
                return
            }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
    


}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

