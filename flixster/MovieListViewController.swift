//
//  MovieListViewController.swift
//  flixster
//
//  Created by Anderson David on 1/20/23.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource {
    var movies: [Movie] = [Movie]()

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing/?api_key=58de9086dcc7bf9440a6289814317f71")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            do {
                let jsonData = try JSONDecoder().decode(MoviesResponse.self, from: data!)
                let movies = jsonData.results
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        task.resume()*/
        movies = MoviesResponse.loadJson()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell),
           let detailViewController = segue.destination as? DetailViewController {
            
            let movie = movies[indexPath.row]
            detailViewController.movie = movie
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
