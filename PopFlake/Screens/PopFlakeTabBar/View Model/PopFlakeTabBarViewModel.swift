//
//  PopFlakeTabBarViewModel.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Network
class PopFlakeTabBarViewModel
{
    var bindNetworkStateToView: (()->())!
    init()
    {
        self.checkNetworkConnectivity()
    }
    func checkNetworkConnectivity()
    {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        monitor.pathUpdateHandler =
        { [weak self] path in
            guard let self = self else {return}
            if path.status != .satisfied
            {
                self.bindNetworkStateToView()
            }
        
        
        }
        monitor.start(queue: queue)
     }
}
