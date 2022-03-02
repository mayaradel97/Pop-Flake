//
//  ImageDataDelegate.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import Foundation
protocol ImageDataDelegate
{
    func getImageData(with url: String)-> Data?
}
extension ImageDataDelegate
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
