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
                    self.homeTableView.reloadData()
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
        case 0,1,2:
            let itemCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.ItemTableViewCell.rawValue) as!      ItemTableViewCell
            self.getCells(indexPath: indexPath, cell: itemCell)
            return itemCell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.TopGossingMoviesTableViewCell.rawValue) as! TopGossingMoviesTableViewCell
            cell.configure(items: homeViewModel.topGrossingItems, homeViewModel: homeViewModel)
            return cell
            
        default:
            return UITableViewCell()
        }
        
        
    }
    func getCells(indexPath: IndexPath,cell: ItemTableViewCell)
   {
    switch indexPath.section
    {
    case 0:
        cell.configure(items: homeViewModel.comingSonnItems, homeViewModel: homeViewModel)
        cell.hideStarIcon = true
        cell.itemType = "comingSonnItems"
    case 1:
        cell.configure(items: homeViewModel.inTheatersItems,homeViewModel: homeViewModel)
        cell.itemType = "inTheatersItems"
    case 2:
        cell.configure(items: homeViewModel.topRatedItems , homeViewModel: homeViewModel)
        cell.itemType = "topRatedItems"
    default:
        break
    }
    
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
