//
//  DetailViewController.swift
//  TrackListApp
//
//  Created by Инна Лаптева on 19.02.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: Properties

    var track: Track!
    @IBOutlet weak var trackCover: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackCover.image = UIImage(named: track.track)
        trackNameLabel.text = track.track

    } 

}
