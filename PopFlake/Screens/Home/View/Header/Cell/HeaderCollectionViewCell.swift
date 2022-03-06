//
//  HeaderCollectionViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit
import SDWebImage
class HeaderCollectionViewCell: UICollectionViewCell,HeaderCellView
{
   
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var videoImageView: UIImageView!
    var videoURL: String!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(itemTrailor: Trailor)
    {
        videoURL = itemTrailor.link
        titleLabel.text = itemTrailor.title
        descriptionLabel.text = itemTrailor.videoTitle
        if let photoUrl = URL(string: itemTrailor.thumbnailUrl){
            videoImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            videoImageView.sd_setImage(with: photoUrl, placeholderImage: UIImage(), options: [.progressiveLoad])
        }
        if let photoUrl = URL(string: itemTrailor.posterImage!){
            posterImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            posterImageView.sd_setImage(with: photoUrl, placeholderImage: UIImage(), options: [.progressiveLoad])
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton)
    {
        guard let videoURL = videoURL
        else
        {
            return
        }
       guard let url = URL(string: videoURL)
       else
       {
           return
       }
        UIApplication.shared.open(url)
    }
}
