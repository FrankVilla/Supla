//
//  UserListViewController.swift
//  Zadanie 5.
//
//  Created by KOVIGROUP on 19/02/2023.
//

import UIKit

class UserListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let viewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchUsers()

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)

        let user = viewModel.users[indexPath.row]

        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email

        return cell
    }
}
