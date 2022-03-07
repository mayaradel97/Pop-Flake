//
//  SearchViewController.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class SearchViewController: UIViewController
{
    var searchController :UISearchController!
    var searchViewModel: SearchViewModel!
    var searchResultTableView: SearchResultTableViewController!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.showSearchController()
        searchViewModel = SearchViewModel()
        self.bindItems()
        self.bindShowLoadingIndicator()
        self.bindHideLoadingIndicator()
        self.bindFailure()
    }
    //MARK: - binding methods
    func bindFailure()
    {
        searchViewModel.bindFailureToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                    self.showAlert(with: "an error occurred")
                }
                
            }
       
    }
    func bindItems()
    {
        searchViewModel.bindItemsToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                    
                    self.searchResultTableView.searchResultViewModel.items = self.searchViewModel.searchItems
                }
                
                
            }
    }
    func bindShowLoadingIndicator()
    {
        searchViewModel.bindShowLoadingIndicatorToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                    self.searchResultTableView.tableView.isHidden = true
                    self.searchResultTableView.loadingIndicator.startAnimating()
                }
            }
    }
    func bindHideLoadingIndicator()
    {
        searchViewModel.bindHideLoadingIndicatorToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                    self.searchResultTableView.tableView.isHidden = true
                    self.searchResultTableView.loadingIndicator.stopAnimating()
                }
            }
    }
    func showSearchController()
    {
        //remove space between searchbar and result controller
        self.extendedLayoutIncludesOpaqueBars = true
        searchResultTableView = (storyboard!.instantiateViewController(withIdentifier: String(describing: SearchResultTableViewController.self)) as! SearchResultTableViewController)
        searchController = UISearchController(searchResultsController: searchResultTableView )
        //change cancel button color
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = .black
        let searchBar = searchController.searchBar
        searchBar.placeholder = "Search IMDb"
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
}
//MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        guard let searchText = searchBar.text
        else{return}
        searchViewModel.getSearchResult(with: searchText)
    }
   
}
