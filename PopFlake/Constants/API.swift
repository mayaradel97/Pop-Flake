//
//  API.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
struct API
{
    static let comingSoonURL = URL(string:  "https://imdb-api.com/en/API/ComingSoon/k_7ba4dhcv")!
    static let inTheatersURL = URL(string:  "https://imdb-api.com/en/API/InTheaters/k_7ba4dhcv")!
    static let topRatingMoviesURL =
        URL(string:  "https://imdb-api.com/en/API/Top250Movies/k_7ba4dhcv")!
   
    static let topGrossingMoviesURL =
        URL(string:  "https://imdb-api.com/en/API/BoxOffice/k_7ba4dhcv")!

   static func getTrailorMoviesURL(with id :String) -> URL
    {
        return  URL(string:  "https://imdb-api.com/en/API/Trailer/k_7ba4dhcv/\(id)")!
    }
    static func getSearchURL(with expression: String)->URL
    {
        return URL(string:  "https://imdb-api.com/en/API/Search/k_7ba4dhcv/\(expression)")!
    }
    static func getDetailsURL(with id: String)-> URL
    {
        return  URL(string:"https://www.imdb.com/title/\(id)")!
    }
   
        
}
