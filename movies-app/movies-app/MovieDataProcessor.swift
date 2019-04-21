//
//  MovieDataProcessor.swift
//  movies-app
//
//  Created by Viktor Sec on 21/04/2019.
//  Copyright © 2019 Viktor Sec. All rights reserved.
//

import Foundation

class MovieDataProcessor {
    static func mapJsonToMovies(object: [String: AnyObject], movieKey: String) -> [Movie] {
        var mappedMovies: [Movie] = []
        
        guard let movies = object[movieKey] as? [[String: AnyObject]] else {
            return mappedMovies
        }
        
        for movie in movies {
            guard let id = movie["imdbID"] as? String,
                let title = movie["Title"] as? String,
                let year = movie["Year"] as? String,
                let imageUrl = movie["Poster"] as? String else {
                    continue
            }
            
            let movieClass = Movie(id: id, title: title, year: year, imageUrl: imageUrl)
            mappedMovies.append(movieClass)
        }
        return mappedMovies
    }
    
    static func write(movies: [Movie]) {
        
    }
}
