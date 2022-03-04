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
    private var refreshController: UIRefreshControl!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        homeViewModel = HomeViewModel()
        self.showRefreshController()
        self.UIManagement()
        self.tableViewConfiguration()
        self.configureHeaderView()
        self.bindItems()
        self.bindFailure()
        
    }
    //MARK: - RefreshController
    func showRefreshController()
    {
        refreshController = UIRefreshControl()
        refreshController.tintColor = .darkGray
        refreshController.addTarget(self, action: #selector(refreshHomeTableView), for: .valueChanged)
        homeTableView.addSubview(refreshController)
        
    }
    @objc func refreshHomeTableView()
    {
        homeViewModel.getData()
        refreshController.endRefreshing()
        
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
                    self.loadingIndicator.stopAnimating()
                    self.headerCollectionView.isHidden = true
                    self.showAlert(with: "an error occurred")
                    
                }
                
            }
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
// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return homeViewModel.headers.count
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
            let cell = self.getCell(of: ComingSoonTableViewCell.self, indexPath: indexPath, tableView: tableView, identifier: HomeTableViewCellConstant.ComingSoonTableViewCell.rawValue)
            return cell
        case 1:
            let cell = self.getCell(of: InTheatersTableViewCell.self, indexPath: indexPath, tableView: tableView, identifier: HomeTableViewCellConstant.InTheatersTableViewCell.rawValue)
            return cell
        case 2:
            let cell = self.getCell(of: TopRatedTableViewCell.self, indexPath: indexPath, tableView: tableView, identifier: HomeTableViewCellConstant.TopRatedTableViewCell.rawValue)
            return cell
        case 3:
            let cell = self.getCell(of: TopGossingMoviesTableViewCell.self, indexPath: indexPath, tableView: tableView, identifier: HomeTableViewCellConstant.TopGossingMoviesTableViewCell.rawValue)
            return cell
            
        default:
            return UITableViewCell()
        }
        
        
    }
    func getCell<T: ItemTableViewCell>(of type: T.Type,indexPath: IndexPath, tableView: UITableView , identifier: String) -> UITableViewCell
    {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
        homeViewModel.configureCell(cell: tableViewCell)
        return tableViewCell as! UITableViewCell
    }
}
//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        60
    }
}
