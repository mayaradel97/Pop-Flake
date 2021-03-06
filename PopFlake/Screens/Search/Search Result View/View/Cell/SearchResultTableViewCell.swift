//
//  SearchResultTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit
import SDWebImage
class SearchResultTableViewCell: UITableViewCell,SearchCellView
{
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(item: ItemSearch)
    {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        if let photoUrl = URL(string: item.image){
            itemImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            itemImageView.sd_setImage(with: photoUrl, placeholderImage: UIImage(), options: [.progressiveLoad])
        }
    }
}
