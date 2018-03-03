//
//  FavoritesViewController.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    var sampleArray = [Job]() {
        didSet {
            favoritesView.jobTableView.reloadData()
        }
    }
    
    let favoritesView = FavoritesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Delegates
        favoritesView.jobTableView.dataSource = self
        favoritesView.jobTableView.delegate = self
    }
    
    private func setupView() {
        self.view.addSubview(favoritesView)
        
    }

}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobTableViewCell
        
        let aJob = sampleArray[indexPath.row]
        
        cell.jobTitleLabel.text = " \(aJob.title_code_no)"
        cell.salaryLabel.text = "\(aJob.salary_range_from) - \(aJob.salary_range_to)"
        cell.fieldLabel.text = " \(aJob.agency)"
        cell.locationLabel.text = " \(aJob.work_location): \(aJob.work_location_1)"
        
        return cell
        
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO
        
    }
}
