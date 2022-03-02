//
//  InTheatersCollectionViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit

class InTheatersCollectionViewCell: UICollectionViewCell,ItemCollectionViewCell,ImageDataDelegate
{
   

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(item: Item)
    {
        titleLabel.text = item.title
        ratingLabel.text = item.imDbRating
        guard let imageData = self.getImageData(with: item.image)
        else{return}
        itemImageView.image = UIImage(data: imageData)
        itemImageView.contentMode = .scaleAspectFit
    }
    

}
