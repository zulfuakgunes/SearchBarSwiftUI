//
//  NetworkLayer.swift
//  SearchBarSwiftUI
//
//  Created by Zülfü Akgüneş on 29.01.2024.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case requestFailed
    case decodingError
}


class NetworkLayer {
    
    func fetchData<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError
        }
    }
}
