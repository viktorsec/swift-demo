import UIKit

var str = "Hello, playground"

str += " Viktor is here"

var string2 = "John"

string2 = "Mike"

class Movie {
    var title: String?
    
    init(title: String?) {
        self.title = title
    }
    
    func getMovieTitle() -> String {
        if let title = title {
            return title
        }

        return "Untitled movie"
    }
}

var movie = Movie(title: "Superbad")
print("This is the movie title: " + movie.getMovieTitle())
