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
    static let topRatingMoviesURL =
        URL(string:  "https://imdb-api.com/en/API/Top250Movies/k_h6qxabfo")!
   
    static let topGrossingMoviesURL =
        URL(string:  "https://imdb-api.com/en/API/BoxOffice/k_h6qxabfo")!
    static var id: String = ""
    static var trailorMoviesURL: URL
    {
        return  URL(string:  "https://imdb-api.com/en/API/Trailer/k_h6qxabfo/\(id)")!
    }
    static var expression: String = ""
    static var searchURL  =
        URL(string:  "https://imdb-api.com/en/API/Search/k_h6qxabfo/\(expression)")!
}
