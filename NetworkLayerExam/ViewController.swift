//
//  ViewController.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var mostPlayedSongs : MostPlayedSongs?
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SongCell", bundle: nil), forCellReuseIdentifier: "songCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchSongs()
    }

    func fetchSongs() {
        self.indicator.isHidden = false
        self.indicator.startAnimating()
        networkManager.getMostPlayedSongs { result in
            self.indicator.stopAnimating()
            self.indicator.isHidden = true
            switch result {
            case .success(let response):
                self.mostPlayedSongs = response
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let songs = mostPlayedSongs?.feed?.results {
            return songs.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as? SongCell {
            cell.nameLabel.text = mostPlayedSongs?.feed?.results?[indexPath.row].name
            cell.artistNameLabel.text = mostPlayedSongs?.feed?.results?[indexPath.row].artistName
            if let imageUrl = mostPlayedSongs?.feed?.results?[indexPath.row].artworkUrl100 {
                cell.songImageView.sd_setImage(with: URL(string: imageUrl))
            }
            return cell
        }
        return UITableViewCell()
        
    }
    
    
}
