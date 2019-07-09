//
//  MovieCell.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 10
        movieImage.clipsToBounds = true
    }
    
    func updateViews(movie : MovieResults){
        self.movieName.text = movie.title
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.backdrop_path ?? " ")")
        self.movieImage.kf.setImage(with: url)
    }
}
