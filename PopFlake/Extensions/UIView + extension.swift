//
//  UIView + extension.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/4/22.
//

import UIKit
extension UIView: IDetailsView
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
