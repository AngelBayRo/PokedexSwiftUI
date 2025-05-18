//
//  PokedexRepository.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 1/4/24.
//

import Foundation
import Combine

class PokedexRepository {
    let apiSession = URLSession.shared
    
    func getData<T: Decodable>(urlPath: String, type: T.Type) -> AnyPublisher<T, Error> {
        print("URL: \(urlPath)")
        guard let url = URL(string: urlPath) else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        
        let publisher = apiSession.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return publisher
    }
    
    func fetchData<T: Decodable>(urlPath: String) async -> Result<T, Error>  {
        guard let url = URL(string: urlPath) else { return .failure(URLError(.badURL)) }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let dataContent = try JSONDecoder().decode(T.self, from: data)
            return .success(dataContent)
        } catch {
            return .failure(URLError(.badURL))
        }
    }
}
