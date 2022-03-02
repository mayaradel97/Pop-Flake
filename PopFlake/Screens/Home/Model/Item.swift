//
//  Item.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
struct Item: Codable
{
    let id: String
    let title: String
    let image: String
    let year: String?
    let imDbRating: String?
    let weekend: String?
    let rank: String?
}
struct Items: Codable
{
    let items: [Item]
}
