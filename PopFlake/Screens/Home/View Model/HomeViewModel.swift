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
    var comingSonnItems: [Item]!
    var inTheatersItems: [Item]!
    var topRatedItems: [Item]!
    var topGrossingItems: [Item]!
    var itemsTrailors: [Trailor]!
    var networkLayer: NetworkLayer!
    var bindItemsToView: (()->())!
    var bindFailureToView: (()->())!
    var timer: Timer?
    var currentHeaderIndex: Int!
    
    init()
    {
        networkLayer = NetworkLayer()
        headers =
            [
                Header(title: "Coming Soon to theaters(US)"),
                Header(title: "In Theaters"),
                Header(title: "Top Rated Movies"),
                Header(title: "Top box Office(US)"),
            ]
        self.getData()
        
    }
    func getData()
    {
        comingSonnItems = []
        inTheatersItems = []
        topRatedItems = []
        topGrossingItems = []
        itemsTrailors = []
        currentHeaderIndex = 0
        self.startTimer()
        self.getComingSoonItems()
        self.getInTheatersItems()
        self.getTopRatedItems()
        self.getTopGrossingItems()
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
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    @objc func moveToNextIndex()
    {
        if currentHeaderIndex < itemsTrailors.count - 1
        {
            currentHeaderIndex += 1
            self.bindItemsToView()
        }
    }
    func configureHeaderCell(cell: HeaderCellView,indexPath: IndexPath)
    {
        cell.configure(itemTrailor: itemsTrailors[indexPath.row])
    }
    func configureHeaderMovement(cell: HeaderMovement)
    {
        cell.moveToNextCell(index: currentHeaderIndex)
        
    }
    //MARK: - data
    func getComingSoonItems()
    {
        
        networkLayer.getResponse(of: Items.self, url: API.comingSoonURL)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
                if items.items.count == 0
                {
                    self.bindFailureToView()
                    return
                }
                self.comingSonnItems += items.items
                self.bindItemsToView()
            }
            else
            {
                self.bindFailureToView()
            }
            
        }
    }
    func getMoviesTrailors()
    {
        guard let randomItem = getRandomItem(items: topRatedItems)
        else {return}
        networkLayer.getResponse(of: Trailor.self, url: API.getTrailorMoviesURL(with:randomItem.id))
        { [weak self](item) in
            guard let self = self else {return}
            if  let item = item
            {
                var itemData = item
                itemData.posterImage = randomItem.image
                self.itemsTrailors.append(itemData)
                self.bindItemsToView()
            }
            else
            {
                //bind failure
                self.bindFailureToView()
            }
            
        }
    }
    func getAllTrailors()
    {
        for _ in 0...10
        {
            self.getMoviesTrailors()
        }
    }
    func getInTheatersItems()
    {
        networkLayer.getResponse(of: Items.self, url: API.inTheatersURL)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
                self.inTheatersItems += items.items
                self.bindItemsToView()
            }
            else
            {
                //bind failure
                self.bindFailureToView()
            }
            
        }
    }
    
    func getTopRatedItems()
    {
        networkLayer.getResponse(of: Items.self, url: API.topRatingMoviesURL)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
                self.topRatedItems += items.items
                self.bindItemsToView()
                self.getAllTrailors()
            }
            else
            {
                //bind failure
                self.bindFailureToView()
            }
            
        }
    }
    func getTopGrossingItems()
    {
        networkLayer.getResponse(of: Items.self, url: API.topGrossingMoviesURL)
        { [weak self](items) in
            guard let self = self else {return}
            if let items = items
            {
                self.topGrossingItems += items.items
                self.bindItemsToView()
            }
            else
            {
                //bind failure
                self.bindFailureToView()
            }
            
        }
    }

}
