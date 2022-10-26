//
//  WebSitesTableViewController.swift
//  Project4
//
//  Created by ALEKSEY SUSLOV on 26.10.2022.
//

import UIKit

class WebSitesTableViewController: UITableViewController {
    
    var websites = ["apple.com", "hackingwithswift.com"]

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "webSiteCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = websites[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "openSite", sender: websites[indexPath.row])
    }


    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ViewController else {
            return
        }
        
        guard let webSite = sender as? String else { return }
        
        vc.websites = websites
        vc.webSite = webSite
    }
}
