//
//  StudentListTableViewController.swift
//  StudentPUT
//
//  Created by Caleb Strong on 8/2/17.
//  Copyright © 2017 Caleb Strong. All rights reserved.
//

import UIKit

class StudentListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)

        return cell
    }
}
