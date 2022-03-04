//
//  HeaderCollectionViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit

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
        guard let imageVideoData = self.getImageData(with: itemTrailor.thumbnailUrl)
        else{return}
        videoImageView.image = UIImage(data: imageVideoData)
        guard let imagePosterData = self.getImageData(with: itemTrailor.posterImage!)
        else{return}
        posterImageView.image = UIImage(data: imagePosterData)
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
