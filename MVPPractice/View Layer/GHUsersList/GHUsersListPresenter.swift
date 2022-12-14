//
//  GHUsersListPresenter.swift
//  MVPPractice
//
//  Created by Vanessa Flores on 8/23/22.
//

import UIKit

protocol GHUsersListPresenterDelegate: AnyObject {
    func presentUsers(users: [GHUser])
    func presentDetail(for user: GHUser)
}

class GHUsersListPresenter {
    typealias PresenterDelegate = GHUsersListPresenterDelegate & UIViewController
    
    weak var delegate: PresenterDelegate?
    let githubService = GithubService()
    var users: [GHUser] = []
    var pagination = 1
    
    init(with delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    func getUsers() {
        githubService.fetchUsers(at: pagination) { [weak self] result in
            guard let self = self else { return }
            self.pagination += 1
            switch result {
            case .success(let users):
                self.users.append(contentsOf: users.map { GHUser(apiUser: $0) })
                self.delegate?.presentUsers(users: self.users)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func navigateToDetail(for user: GHUser) {
        let viewController = GHUserDetailViewController(with: user)
        delegate?.navigationController?.pushViewController(viewController, animated: true)
    }
}

private extension GHUser {
    init(apiUser: APIGHUser) {
        self.username = apiUser.username
        self.avatarUrl = apiUser.avatarUrl
        self.name = apiUser.name
        self.bio = apiUser.bio
        self.following = apiUser.following
        self.followers = apiUser.followers
    }
}
