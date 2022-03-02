//
//  PopFlakeTabBarController.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class PopFlakeTabBarController: UITabBarController
{
   private var popFlakeTabBarViewModel: PopFlakeTabBarViewModel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        popFlakeTabBarViewModel = PopFlakeTabBarViewModel()
        self.bindNetworkState()

    }
    
    func bindNetworkState()
    {
        popFlakeTabBarViewModel.bindNetworkStateToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                self.showAlert(with: "No Internt Connection")
                }
                
            }
    }
    
}
