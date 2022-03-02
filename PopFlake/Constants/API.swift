//
//  API.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
struct API
{
    static let comingSoonURL = URL(string:  "https://imdb-api.com/en/API/ComingSoon/k_h6qxabfo")!
    static let inTheatersURL = URL(string:  "https://imdb-api.com/en/API/InTheaters/k_h6qxabfo")!
    static let topRatingMovies =
        URL(string:  "https://imdb-api.com/en/API/Top250Movies/k_h6qxabfo")!
   
    static let topGrossingMovies =
        URL(string:  "https://imdb-api.com/en/API/BoxOffice/k_h6qxabfo")!
    static var id: String = ""
    static var trailorMovies: URL
    {
        return  URL(string:  "https://imdb-api.com/en/API/Trailer/k_h6qxabfo/\(id)")!
    }
}
