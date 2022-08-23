//
//  APIUser.swift
//  MVPPractice
//
//  Created by Vanessa Flores on 8/23/22.
//

import Foundation

struct APIUser: Codable {
    var username: String?
    var avatarUrl: String?
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int?
    var publicGists: Int?
    var profile: String?
    var following: Int?
    var followers: Int?
    var createdAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case username       = "login"
        case avatarUrl      = "avatar_url"
        case publicRepos    = "public_repos"
        case publicGists    = "public_gists"
        case profile        = "html_url"
        case createdAt      = "created_at"
        
        case name
        case location
        case bio
        case following
        case followers
    }
}
