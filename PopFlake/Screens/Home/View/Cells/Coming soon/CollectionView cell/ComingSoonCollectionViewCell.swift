//
//  ComingSoonCollectionViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class ComingSoonCollectionViewCell: UICollectionViewCell,ItemCollectionViewCell
{
    @IBOutlet weak var itemYear: UILabel!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 15
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds = true
    }
    func configure(item: Item)
    {
        itemTitle.text = item.title
        itemYear.text = item.year
        guard let imageData = self.getImageData(with: item.image)
        else{return}
        itemImage.image = UIImage(data: imageData)
        itemImage.contentMode = .scaleAspectFit
    }

}
