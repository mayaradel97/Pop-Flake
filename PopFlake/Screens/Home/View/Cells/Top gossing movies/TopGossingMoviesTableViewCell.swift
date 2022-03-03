//
//  TopGossingMoviesTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class TopGossingMoviesTableViewCell: UITableViewCell,ItemTableViewCell, IDetailsView
{

    
    @IBOutlet weak var topGrossingTableView: UITableView!
    let cell = String(describing: TopGrossingInnerCell.self)
    var items: [Item] = []
    var homeViewModel: HomeViewModel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(items: [Item],homeViewModel: HomeViewModel)
    {
        self.homeViewModel = homeViewModel
        self.items = items
        topGrossingTableView.reloadData()
    }
    
    func setUpCell()
    {
        
        topGrossingTableView.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        topGrossingTableView.dataSource = self
        topGrossingTableView.delegate = self
    }
    
    func configureCell(cell: ItemCollectionViewCell, indexPath: IndexPath)
    {
        cell.configure(item: items[indexPath.row])
    }
}
extension TopGossingMoviesTableViewCell: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let topGrossingInnerCell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! TopGrossingInnerCell
        self.configureCell(cell: topGrossingInnerCell, indexPath: indexPath)
        return topGrossingInnerCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       
            let id = items[indexPath.row].id
            self.showDetailsSafariView(with: id)

    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        
            if indexPath.row == items.count - 1
            {
                homeViewModel.getTopGrossingItems()
            }
    }
}
