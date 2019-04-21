//
//  ViewController.swift
//  movies-app
//
//  Created by Viktor Sec on 21/04/2019.
//  Copyright © 2019 Viktor Sec. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favouriteMovies: [Movie] = []
    
    @IBOutlet var mainTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "searchMoviesSegue") {
            let controller = segue.destination as! SearchViewController
            controller.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "customcell",
                                                      for: indexPath) as! CustomTableViewCell
        let index: Int = indexPath.row
        movieCell.movieTitle?.text = favouriteMovies[index].title
        movieCell.movieYear?.text = favouriteMovies[index].year
        displayMovieImage(index, movieCell: movieCell)
        return movieCell
    }
    
    func displayMovieImage(_ row: Int, movieCell: CustomTableViewCell) {
        let url: String = (URL(string: favouriteMovies[row].imageUrl)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {
            (data, response, error) -> Void in
                if (error != nil) {
                    print(error!)
                    return
                }
            
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                movieCell.movieImageView?.image = image
            })
        }).resume()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
        if (favouriteMovies.count == 0) {
            favouriteMovies.append(
                Movie(
                    id: "tt0829482",
                    title: "Superbad",
                    year: "2007",
                    imageUrl: "https://m.media-amazon.com/images/M/MV5BMTc0NjIyMjA2OF5BMl5BanBnXkFtZTcwMzIxNDE1MQ@@._V1_UX182_CR0,0,182,268_AL_.jpg"
                )
            )
        }
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

