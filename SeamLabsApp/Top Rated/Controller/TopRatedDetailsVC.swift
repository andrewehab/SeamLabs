//
//  TopRatedDetailsVC.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit

class TopRatedDetailsVC: UIViewController {
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieReleasedDate: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieVoteVount: UILabel!
    
    var movieData : MovieResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backdropImage.RoundedImage(cornerRadius: 10, borderWifth: nil, borderColor: nil)
        
        posterImage.RoundedImage(cornerRadius: self.posterImage.frame.size.width / 2, borderWifth: 2.0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        
        movieReleasedDate.RoundedLabel(cornerRadius: 10, borderWidth: 2.0, borderColor: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1))
        
        movieRate.RoundedLabel(cornerRadius: self.movieRate.frame.size.width / 2, borderWidth: nil, borderColor: nil)
        
        // remove back title
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        // add navigation title and color
        self.navigationItem.title = "MOVIE INFO"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showMovieDetails()
    }
    
    func showMovieDetails(){
        
        movieName.text = movieData?.title
        movieOverview.text = movieData?.overview
        movieRate.text = movieData?.title
        
        let voteCount  = ((movieData?.vote_count)! as NSNumber).intValue
        movieVoteVount.text = "\(String(voteCount))"
        
        let rating  = ((movieData?.vote_average)! as NSNumber).doubleValue
        movieRate.text = "\(String(rating))"
        
        let movieDate = movieData?.release_date ?? "Not Defined"
        movieReleasedDate.text = "  \(movieDate)  "
        
        
        let backdrpUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(movieData!.backdrop_path ?? " ")")
        backdropImage.kf.setImage(with: backdrpUrl)
        
        let posterUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(movieData!.poster_path ?? " ")")
        posterImage.kf.setImage(with: posterUrl)
        
        
        
    }
}
