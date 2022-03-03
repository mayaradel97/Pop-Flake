//
//  API.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
struct API
{
    static let comingSoonURL = URL(string:  "https://imdb-api.com/en/API/ComingSoon/k_usuzybq8")!
    static let inTheatersURL = URL(string:  "https://imdb-api.com/en/API/InTheaters/k_usuzybq8")!
    static let topRatingMoviesURL =
        URL(string:  "https://imdb-api.com/en/API/Top250Movies/k_usuzybq8")!
   
    static let topGrossingMoviesURL =
        URL(string:  "https://imdb-api.com/en/API/BoxOffice/k_usuzybq8")!

   static func getTrailorMoviesURL(with id :String) -> URL
    {
        return  URL(string:  "https://imdb-api.com/en/API/Trailer/k_usuzybq8/\(id)")!
    }
    static func getSearchURL(with expression: String)->URL
    {
        return URL(string:  "https://imdb-api.com/en/API/Search/k_usuzybq8/\(expression)")!
    }
    static func getDetailsURL(with id: String)-> URL
    {
        return  URL(string:"https://www.imdb.com/title/\(id)")!
    }
   
        
}
