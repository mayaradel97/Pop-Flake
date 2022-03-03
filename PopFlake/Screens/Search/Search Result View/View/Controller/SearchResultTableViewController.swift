//
//  SearchResultTableViewController.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit

class SearchResultTableViewController: UIViewController
{
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var searchResultViewModel: SearchResultViewModel!
    var cell: String!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        searchResultViewModel = SearchResultViewModel()
        self.tableViewRegisteration()
        self.bindItems()
        
    }
    func tableViewRegisteration()
    {
        cell = String(describing: SearchResultTableViewCell.self)
        tableView.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
    }
    func bindItems()
    {
        searchResultViewModel.bindItemsToView =
            {
                [ weak self] in
                guard let self = self else {
                    return
                }
                DispatchQueue.main.async
                {
                    self.tableView.isHidden = false
                    self.tableView.reloadData()
                    self.loadingIndicator.stopAnimating()
                }
            }
        
    }
    
    
}
// MARK: - Table view data source
extension SearchResultTableViewController: UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return searchResultViewModel.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
        searchResultViewModel.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        100
    }
}




