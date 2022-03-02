//
//  ItemsCellView.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
protocol ItemTableViewCell
{
    func configure(items: [Item])
    func setUpCell()
    func configureCell(cell: ItemCollectionViewCell,indexPath: IndexPath)
}
protocol ItemCollectionViewCell
{
    func configure(item: Item)
    func getImageData(with url: String)-> Data?
}
extension ItemCollectionViewCell
{
    func getImageData(with url: String)-> Data?
    {
        let url = URL(string: url)
        guard let imageURL = url
        else
        {
            return nil
        }
       guard let imageData = try? Data(contentsOf: imageURL)
        else
       {
        return nil
       }
        return imageData
    }
}
