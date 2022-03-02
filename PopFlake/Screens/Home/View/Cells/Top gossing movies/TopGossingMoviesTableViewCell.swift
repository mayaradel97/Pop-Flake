//
//  TopGossingMoviesTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class TopGossingMoviesTableViewCell: UITableViewCell,ItemTableViewCell
{

    
    @IBOutlet weak var topGrossingTableView: UITableView!
    let cell = String(describing: TopGrossingInnerCell.self)
    var items: [Item] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(items: [Item])
    {
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
    
    
}
