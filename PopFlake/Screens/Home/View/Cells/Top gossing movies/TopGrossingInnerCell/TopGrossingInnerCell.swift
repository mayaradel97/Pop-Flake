//
//  TopGrossingInnerCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit

class TopGrossingInnerCell: UITableViewCell,IInnerViewCell
{
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weekendGrossingLabel: UILabel!

    func configure(item: Item,hideStarIcon: Bool)
    {
        rankLabel.text = item.rank
        titleLabel.text = item.title
        weekendGrossingLabel.text = item.weekend
    }
}
