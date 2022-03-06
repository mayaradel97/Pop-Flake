//
//  API.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
struct API
{
   static let apiKey = "k_36wium9j"
    static let comingSoonURL = URL(string:  "https://imdb-api.com/en/API/ComingSoon/\(apiKey)")!
    static let inTheatersURL = URL(string:  "https://imdb-api.com/en/API/InTheaters/\(apiKey)")!
    static let topRatingMoviesURL =
        URL(string:  "https://imdb-api.com/en/API/Top250Movies/\(apiKey)")!
   
    static let topGrossingMoviesURL =
        URL(string:  "https://imdb-api.com/en/API/BoxOffice/\(apiKey)")!

   static func getTrailorMoviesURL(with id :String) -> URL
    {
        return  URL(string:  "https://imdb-api.com/en/API/Trailer/\(apiKey)/\(id)")!
    }
    static func getSearchURL(with expression: String)->URL
    {
        return URL(string:  "https://imdb-api.com/en/API/Search/\(apiKey)/\(expression)")!
    }
    static func getDetailsURL(with id: String)-> URL
    {
        return  URL(string:"https://www.imdb.com/title/\(id)")!
    }
   
        
}
