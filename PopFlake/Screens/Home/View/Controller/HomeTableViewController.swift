//
//  HomeTableViewController.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class HomeTableViewController: UITableViewController
{
   var homeViewModel: HomeViewModel!
    let cell = String(describing: HeaderCollectionViewCell.self)
    var headerCollectionView: UICollectionView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        homeViewModel = HomeViewModel()
        self.cellRegesteration()
        self.bindItems()
        self.configureHeaderView()
    }
    
    
    func bindItems()
    {
        homeViewModel.bindProductsToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                    self.headerCollectionView.reloadData()
                }
            }
    }
    
    func cellRegesteration()
    {
        HomeTableViewCellConstant.allCases.forEach
        {
            tableView.register(UINib(nibName: $0.rawValue, bundle: nil), forCellReuseIdentifier: $0.rawValue)
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return homeViewModel.headers.count
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        
        return homeViewModel.headers[section].title
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        360
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.section
        {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.ComingSoonTableViewCell.rawValue, for: indexPath) as! ComingSoonTableViewCell
            homeViewModel.configureCell(cell: cell)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.InTheatersTableViewCell.rawValue, for: indexPath) as! InTheatersTableViewCell
            homeViewModel.configureCell(cell: cell)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.TopRatedTableViewCell.rawValue, for: indexPath) as! TopRatedTableViewCell
            homeViewModel.configureCell(cell: cell)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.TopGossingMoviesTableViewCell.rawValue, for: indexPath) as! TopGossingMoviesTableViewCell
            homeViewModel.configureCell(cell: cell)
            return cell
            
        default:
            return UITableViewCell()
        }
        
        
    }
    
    
    
}

