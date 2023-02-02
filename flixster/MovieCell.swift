//
//  MovieCell.swift
//  flixster
//
//  Created by William Kwon on 12/11/1401 AP.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescLabel: UILabel!
    
    func configure(with movie: Movie) {
        movieNameLabel.text = movie.original_title;
        movieDescLabel.text = movie.overview;
        
        let url = (Movie.posterBaseURLString + movie.poster_path)
        Nuke.loadImage(with: URL(string: url)!, into: movieImageView);
    }
}
