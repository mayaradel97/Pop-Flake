//
//  InTheatersCollectionViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit
import SDWebImage
class ItemCollectionViewCell: UICollectionViewCell,IInnerViewCell
{
    @IBOutlet weak var starIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    var item: Item!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
    }
    func configure(item: Item,hideStarIcon: Bool)
    {
        if hideStarIcon
        {
            starIcon.isHidden = true
            ratingLabel.text = item.title
            titleLabel.text = item.year
            ratingLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16).isActive = true
        }
        else
        {
        titleLabel.text = item.title
        ratingLabel.text = item.imDbRating
        }
        if let photoUrl = URL(string: item.image)
        {
            itemImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            itemImageView.sd_setImage(with: photoUrl, placeholderImage: UIImage(), options: [.progressiveLoad])
        }
    }
}
