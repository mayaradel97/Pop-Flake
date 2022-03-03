//
//  ItemSearch.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import Foundation
struct ItemSearch: Codable
{
    let id: String
    let title: String
    let image: String
    let description: String
}
struct ItemSearchResult: Codable
{
    let results: [ItemSearch]
}
