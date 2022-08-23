//
//  ViewController.swift
//  MVPPractice
//
//  Created by Vanessa Flores on 8/22/22.
//

import UIKit

class GHUsersListViewController: UIViewController {
    
    private var presenter: GHUsersListPresenter?
    private var users: [GHUser] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Users"
        
        configurePresenter()
        configureTableView()
    }

    private func configurePresenter() {
        presenter = GHUsersListPresenter(with: self)
        presenter?.getUsers()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension GHUsersListViewController: GHUsersListPresenterDelegate {
    func presentUsers(users: [GHUser]) {
        self.users = users
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentDetail(for user: GHUser) {
        presenter?.navigateToDetail(for: user)
    }
}

extension GHUsersListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = users[indexPath.row].username
        cell.contentConfiguration = config
        
        let reloadPoint = self.users.count - 10
        let loadNext = indexPath.row == reloadPoint
        if loadNext {
            presenter?.getUsers()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presentDetail(for: self.users[indexPath.row])
    }
}
