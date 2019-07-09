//
//  TopRatedVC.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class TopRatedVC: UIViewController {
    
    var moviesData = [MovieResults] ()
    
    @IBOutlet var topRatedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topRatedTableView.delegate = self
        topRatedTableView.dataSource = self
        
        // set navigation title and color font , type
        self.navigationItem.title = "MOVIES"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // show tabbar when returned from movie details view
        self.tabBarController!.tabBar.isHidden = false
        
        getMovies()
    }
    
    
    func getMovies(){
        NetworkManager.getMovies() { [weak self](success, error, moviesResult) in
            guard let self = self else { return }
            if success {
                DispatchQueue.main.async {
                    self.moviesData = moviesResult ?? [MovieResults]()
                    self.topRatedTableView.reloadData()
                }
                
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }
}

extension TopRatedVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UITableViewCell()}
        
        let movies = moviesData[indexPath.row]
        cell.updateViews(movie: movies)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let topRatedDetailsVC = storyboard?.instantiateViewController(withIdentifier: "TopRatedDetailsVC") as? TopRatedDetailsVC
        topRatedDetailsVC?.movieData = moviesData[indexPath.row]
        navigationController?.pushViewController(topRatedDetailsVC!, animated: true)
    }
    
}



