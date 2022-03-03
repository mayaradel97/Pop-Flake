//
//  ComingSoonCollectionViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit
extension UIView {
  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            let cornerMasks = [
                corners.contains(.topLeft) ? CACornerMask.layerMinXMinYCorner : nil,
                corners.contains(.topRight) ? CACornerMask.layerMaxXMinYCorner : nil,
                corners.contains(.bottomLeft) ? CACornerMask.layerMinXMaxYCorner : nil,
                corners.contains(.bottomRight) ? CACornerMask.layerMaxXMaxYCorner : nil,
                corners.contains(.allCorners) ? [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner, CACornerMask.layerMinXMaxYCorner, CACornerMask.layerMaxXMaxYCorner] : nil
                ].compactMap({ $0 })

            var maskedCorners: CACornerMask = []
            cornerMasks.forEach { (mask) in maskedCorners.insert(mask) }

            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = maskedCorners
        } else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
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
        itemImage.contentMode = .scaleAspectFit
    }

}
