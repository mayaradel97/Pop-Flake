//
//  IDetailsView.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/3/22.
//

import UIKit
protocol IDetailsView
{
    func showDetailsSafariView(with id: String)
}
extension IDetailsView
{
    func showDetailsSafariView(with id: String)
    {
       
        UIApplication.shared.open(API.getDetailsURL(with: id))
    }
}
