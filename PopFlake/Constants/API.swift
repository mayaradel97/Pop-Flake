//
//  API.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
struct API
{
    static let comingSoonURL = URL(string:  "https://imdb-api.com/en/API/ComingSoon/k_ufm16m45")!
    static let inTheatersURL = URL(string:  "https://imdb-api.com/en/API/InTheaters/k_ufm16m45")!
    static let topRatingMovies =
        URL(string:  "https://imdb-api.com/en/API/Top250Movies/k_ufm16m45")!
   
    static let topGrossingMovies =
        URL(string:  "https://imdb-api.com/en/API/BoxOffice/k_ufm16m45")!
}
