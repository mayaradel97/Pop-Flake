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
    var comingSonnItems: [Item]
    var inTheatersItems: [Item]
    var topRatedItems: [Item]
    var topGrossingItems: [Item]
    var itemsTrailors: [Trailor]
    var networkLayer: NetworkLayer!
    var bindProductsToView: (()->())!
    
    init()
    {
        comingSonnItems = []
        inTheatersItems = []
        topRatedItems = []
        topGrossingItems = []
        itemsTrailors = []
        networkLayer = NetworkLayer()
        headers =
        [
            Header(title: "Coming Soon"),
            Header(title: "In Theaters"),
            Header(title: "Top Rated Movies"),
            Header(title: "Top box Office"),
        ]
       
//        self.getComingSoonItems()
        self.getInTheatersItems()
//        self.getTopRatedItems()
//       self.getTopGrossingItems()
        self.getInTheatersItems()
    }
    //MARK: - Header
    func getRandomItem(items: [Item]) ->Item?
    {
        guard let item = items.randomElement()
        else
        {
            return nil
        }
       return item
    }
    func getMoviesTrailors()
    {
        guard let item = getRandomItem(items: inTheatersItems)
       else {return}
        API.id = item.id
        networkLayer.getResponse(of: [Trailor].self, url: API.trailorMovies)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
               
                self.itemsTrailors = items
                self.bindProductsToView()
            }
            else
            {
                //bind failure
            }
            
        }
    }
    //MARK: - data
    func getComingSoonItems()
    {
        networkLayer.getResponse(of: Items.self, url: API.comingSoonURL)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
                self.comingSonnItems = items.items
                self.bindProductsToView()
            }
            else
            {
                //bind failure
            }
            
        }
    }
    func getInTheatersItems()
    {
        networkLayer.getResponse(of: Items.self, url: API.inTheatersURL)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
                self.inTheatersItems = items.items
                self.bindProductsToView()
            }
            else
            {
                //bind failure
            }
            
        }
    }
    func configureHeaderCell(cell: HeaderCellView,indexPath: IndexPath)
    {
        cell.configure(itemTrailor: itemsTrailors[indexPath.row])
    }
    func getTopRatedItems()
    {
        networkLayer.getResponse(of: Items.self, url: API.topRatingMovies)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
                self.topRatedItems = items.items
                self.bindProductsToView()
            }
            else
            {
                //bind failure
            }
            
        }
    }
    func getTopGrossingItems()
    {
        networkLayer.getResponse(of: Items.self, url: API.topGrossingMovies)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
                self.topGrossingItems = items.items
                self.bindProductsToView()
            }
            else
            {
                //bind failure
            }
            
        }
    }
    func configureCell(cell: ItemTableViewCell)
    {
        cell.setUpCell()
        switch cell
        {
        case is ComingSoonTableViewCell:
            cell.configure(items: comingSonnItems)
        case is InTheatersTableViewCell:
            cell.configure(items: inTheatersItems)
        case is TopRatedTableViewCell:
            cell.configure(items: topRatedItems)
        case is TopGossingMoviesTableViewCell:
            cell.configure(items: topGrossingItems)
        default:
            print("other")
        }
       
    }
}
