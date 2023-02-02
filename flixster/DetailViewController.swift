//
//  DetailViewController.swift
//  flixster
//
//  Created by William Kwon on 12/11/1401 AP.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    var movie: Movie!
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieVoteAvg: UITextView!
    @IBOutlet weak var movieVotes: UITextView!
    @IBOutlet weak var moviePopularity: UITextView!
    @IBOutlet weak var movieOverview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = (Movie.posterBaseURLString + movie.poster_path)
        Nuke.loadImage(with: URL(string: url)!, into: movieImage);
        
        movieVoteAvg.text = String(movie.vote_average) + " Vote Average"
        movieVotes.text = String(movie.vote_count) + " Votes"
        moviePopularity.text = String(movie.popularity) + " Popularity"
        movieOverview.text = movie.overview
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
