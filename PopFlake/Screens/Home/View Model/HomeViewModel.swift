//
//  HomeViewModel.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
class HomeViewModel
{
    var headers: [Header]
    var items: [Item]
    var networkLayer: NetworkLayer!
    var bindProductsToView: (()->())!
    
    init()
    {
        items = []
        networkLayer = NetworkLayer()
        headers =
        [
            Header(title: "Coming Soon"),
            Header(title: "In Theaters"),
            Header(title: "Top Rated Movies"),
            Header(title: "Top Grossing Movies"),
        ]
        self.getComingSoonItems()
    }
    func getComingSoonItems()
    {
        networkLayer.getResponse(of: Items.self, url: API.comingSoonURL)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
                self.items = items.items
                self.bindProductsToView()
            }
            else
            {
                //bind failure
            }
            
        }
    }
    func configureCell(cell: ItemCellView, indexPath: IndexPath)
    {
        cell.configure(item: items[indexPath.row])
    }
}
