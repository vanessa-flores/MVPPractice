//
//  GitHubService.swift
//  MVPPractice
//
//  Created by Vanessa Flores on 8/23/22.
//

import Foundation

protocol GithubServiceProtocol {
    var networkManager: NetworkManagerProtocol { get }
    
    func fetchUsers(at page: Int, _ completion: @escaping (Result<[APIUser], Error>) -> Void)
}

final class GithubService: GithubServiceProtocol {
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchUsers(at page: Int, _ completion: @escaping (Result<[APIUser], Error>) -> Void) {
        networkManager.fetch(Endpoint.users(page: page), completion: completion)
    }
}
