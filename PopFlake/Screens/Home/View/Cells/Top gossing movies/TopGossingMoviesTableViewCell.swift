//
//  TopGossingMoviesTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class TopGossingMoviesTableViewCell: UITableViewCell,ITableViewCell
{
    @IBOutlet weak var topGrossingTableView: UITableView!
    let cell = String(describing: TopGrossingInnerCell.self)
    var items: [Item] = []
    var homeViewModel: HomeViewModel!
    override  func awakeFromNib()
    {
      
        self.setUpCell()
    }
    func configure(items: [Item],homeViewModel: HomeViewModel)
    {
        self.items = items
        self.homeViewModel = homeViewModel
        DispatchQueue.main.async
        { [weak self] in
            guard let self = self else {return}
            self.topGrossingTableView.reloadData()
            self.topGrossingTableView.scrollRectToVisible(CGRect.zero, animated: false)
        }
    }
    
    func setUpCell()
    {
        
        topGrossingTableView.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        topGrossingTableView.dataSource = self
        topGrossingTableView.delegate = self
    }
    
}
//MARK: - UITableViewDataSource
extension TopGossingMoviesTableViewCell: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let topGrossingInnerCell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! TopGrossingInnerCell
        topGrossingInnerCell.configure(item: items[indexPath.item], hideStarIcon: false)
        return topGrossingInnerCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        
        if indexPath.row == items.count - 1
        {
            homeViewModel.getTopGrossingItems()
        }
    }
}
//MARK: - UITableViewDelegate
extension TopGossingMoviesTableViewCell: UITableViewDelegate,IDetailsView
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let id = items[indexPath.row].id
        self.showDetailsSafariView(with: id)
        
    }
}
