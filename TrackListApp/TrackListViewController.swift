//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Инна Лаптева on 19.02.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class TrackListViewController: UITableViewController {
    
    //:MARK Properties
    
    var trackList = Track.getTrackList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 70
        
        navigationItem.rightBarButtonItem = editButtonItem
 
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackName", for: indexPath)
        
        let track = trackList[indexPath.row]
        
        cell.imageView?.image = UIImage(named: track.track)
        cell.textLabel?.text = track.song
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = track.artist
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 70
    //    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let track = trackList[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: track)
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    // MARK: - Navigation
    // Переход от ячейки
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if let indexPath = tableView.indexPathForSelectedRow {
//            let detailVC = segue.destination as! DetailViewController
//            detailVC.track = trackList[indexPath.row]
//        }
//
//    }
    
    //переход от вью контроллера showDetails
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.track = sender as? Track
        }
        
    }
    
    
}
