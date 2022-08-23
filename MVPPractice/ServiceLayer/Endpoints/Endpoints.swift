//
//  Endpoints.swift
//  MVPPractice
//
//  Created by Vanessa Flores on 8/23/22.
//

import Foundation

extension Endpoint {
    static func users(page: Int) -> Self {
        return Endpoint(path: "/users",
                        queryItems: [
                            URLQueryItem(name: "per_page", value: "\(limit)"),
                            URLQueryItem(name: "page", value: "\(page)")
                        ])
    }
 }
