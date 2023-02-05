//
//  PosterViewController.swift
//  flixster
//
//  Created by William Kwon on 12/11/1401 AP.
//

import Combine
import UIKit
import Nuke

class PosterViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let poster = posters[indexPath.item]
        let url = (Movie.posterBaseURLString + poster.poster_path)
        Nuke.loadImage(with: URL(string: url)!, into: cell.posterImageView);
        return cell;
    }
    
    var posters: [Movie] = []

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing/?api_key=58de9086dcc7bf9440a6289814317f71")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            do {
                let jsonData = try JSONDecoder().decode(MoviesResponse.self, from: data!)
                let posters = jsonData.results
                DispatchQueue.main.async {
                    self?.posters = posters
                    self?.collectionView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 4
        let numberOfColumns: CGFloat = 3
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
            let indexPath = collectionView.indexPath(for: cell),
            let detailViewController = segue.destination as? DetailViewController {

            let poster = posters[indexPath.row]
            detailViewController.movie = poster
        }
    }
}
