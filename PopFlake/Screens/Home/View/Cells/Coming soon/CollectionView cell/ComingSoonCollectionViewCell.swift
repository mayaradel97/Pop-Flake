//
//  ComingSoonCollectionViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit
class ComingSoonCollectionViewCell: UICollectionViewCell,ItemCollectionViewCell,ImageDataDelegate
{
    @IBOutlet weak var itemYear: UILabel!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.layer.cornerRadius = 20

    }
    func configure(item: Item)
    {
        itemTitle.text = item.title
        itemYear.text = item.year
        guard let imageData = self.getImageData(with: item.image)
        else{return}
        itemImage.image = UIImage(data: imageData)
    }

}
