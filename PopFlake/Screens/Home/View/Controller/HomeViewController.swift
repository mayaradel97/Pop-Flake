//
//  HomeTableViewController.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class HomeViewController: UIViewController
{
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var homeTableView: UITableView!
    var homeViewModel: HomeViewModel!
    var headerCollectionViewCell: String!
    var headerCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        homeViewModel = HomeViewModel()
        self.UIManagement()
        self.tableViewConfiguration()
        self.configureHeaderView()
        self.bindItems()
        self.bindFailure()
        self.bindShowLoadingIndicator()
        self.bindHideLoadingIndicator()
        
        

    }
    func UIManagement()
    {
        self.homeTableView.isHidden = true
        self.loadingIndicator.startAnimating()
    }
    
    func bindFailure()
    {
        homeViewModel.bindFailureToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                    self.homeTableView.isHidden = true
                    self.headerCollectionView.isHidden = true
                    self.showAlert(with: "an error occurred")
                   
                }
               
            }
    }
    func bindShowLoadingIndicator()
    {
        print("binding")
        homeViewModel.bindShowLoadingIndicatorToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                    self.homeTableView.isHidden = true
                    self.loadingIndicator.startAnimating()
                }
            }
            
    }
    func bindHideLoadingIndicator()
    {
        
    }
    func bindItems()
    {
        homeViewModel.bindItemsToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                    self.loadingIndicator.stopAnimating()
                    self.homeTableView.isHidden = false
                    self.homeViewModel.configureHeaderMovement(cell: self)
                    self.homeTableView.reloadData()
                    self.headerCollectionView.reloadData()
                }
            }
    }
    func tableViewConfiguration()
    {
        UITableViewHeaderFooterView.appearance().tintColor = .white
        HomeTableViewCellConstant.allCases.forEach
        {
            homeTableView.register(UINib(nibName: $0.rawValue, bundle: nil), forCellReuseIdentifier: $0.rawValue)
        }
    }
  
}
// MARK: - Table view data source
extension HomeViewController: UITableViewDelegate,UITableViewDataSource
{
     func numberOfSections(in tableView: UITableView) -> Int
    {
        return homeViewModel.headers.count
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        60
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        
        return homeViewModel.headers[section].title
        
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        400
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
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
