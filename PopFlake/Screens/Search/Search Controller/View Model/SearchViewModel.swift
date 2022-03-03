//
//  SearchViewModel.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import Foundation
class SearchViewModel
{
    private var networkLayer:NetworkLayer
    var searchItems: [ItemSearch]
    var bindItemsToView: (()->())!
    var bindFailureToView: (()->())!
    var bindShowLoadingIndicatorToView: (()->())!
    var bindHideLoadingIndicatorToView: (()->())!
    init()
    {
        networkLayer = NetworkLayer()
        searchItems = []
    }
    func getSearchResult(with text: String)
    {
        self.bindShowLoadingIndicatorToView()
        let txt = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        API.expression = txt!
        networkLayer.getResponse(of: ItemSearchResult.self, url: API.searchURL)
        { [weak self](items) in
            guard let self = self else {return}
            if  let items = items
            {
                self.searchItems = items.results
                self.bindItemsToView()
            }
            else
            {
                //bind failure
                self.bindFailureToView()
                self.bindHideLoadingIndicatorToView()
            }
            
        }
        
    }
}
