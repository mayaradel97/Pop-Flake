//
//  TopGrossingInnerCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit

class TopGrossingInnerCell: UITableViewCell,ItemCollectionViewCell
{

    
    @IBOutlet weak var rankLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var weekendGrossingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(item: Item)
    {
        rankLabel.text = item.rank
        titleLabel.text = item.title
        weekendGrossingLabel.text = item.weekend
    }
}
