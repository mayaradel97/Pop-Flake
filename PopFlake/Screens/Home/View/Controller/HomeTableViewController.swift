//
//  HomeTableViewController.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class HomeTableViewController: UITableViewController
{
    private var homeViewModel: HomeViewModel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        homeViewModel = HomeViewModel()
        self.cellRegesteration()
        self.bindItems()
       
    }

    func bindItems()
    {
        homeViewModel.bindProductsToView =
            {
                [weak self] in
                guard let self = self else {return}
                DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                }
            }
    }
    
    func cellRegesteration()
    {
        HomeTableViewCellConstant.allCases.forEach
        {
            tableView.register(UINib(nibName: $0.rawValue, bundle: nil), forCellReuseIdentifier: $0.rawValue)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return homeViewModel.headers.count
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        60
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        
        return homeViewModel.headers[section].title
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        360
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.section
        {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.ComingSoonTableViewCell.rawValue, for: indexPath) as! ComingSoonTableViewCell
           // homeViewModel.configureCell(cell: cell, indexPath: indexPath)
           // cell.setUpCell()
            print("i\(homeViewModel.items.count)")
            cell.items = homeViewModel.items
            cell.setUpCell()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.InTheatersTableViewCell.rawValue, for: indexPath) as! InTheatersTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.TopRatedTableViewCell.rawValue, for: indexPath) as! TopRatedTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellConstant.TopGossingMoviesTableViewCell.rawValue, for: indexPath) as! TopGossingMoviesTableViewCell
            return cell

        default:
            return UITableViewCell()
        }

        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
