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
        { path in
            if path.status != .satisfied
            {
                self.bindNetworkStateToView()
            }
        
        
        }
        monitor.start(queue: queue)
     }
}
