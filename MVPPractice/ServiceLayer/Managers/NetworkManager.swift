//
//  NetworkManager.swift
//  MVPPractice
//
//  Created by Vanessa Flores on 8/23/22.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetch<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    func fetch<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = endpoint.url
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            do {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    preconditionFailure("did not get a valid HTTPURLResponse")
                }
                
                guard let data = data else {
                    preconditionFailure("did not decode any data")
                }
                
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
