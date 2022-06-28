//
//  NetworkManager.swift
//  NetworkLayerExam
//
//  Created by Kafein on 24.06.2022.
//

import Foundation
import Moya

protocol NetworkDelegate {
    var provider: MoyaProvider<API> { get }
    
    func getMostPlayedSongs(completion: @escaping (Result<MostPlayedSongs, NetworkError>) ->())
}

class NetworkManager: NetworkDelegate {
    var provider = MoyaProvider<API> (
        plugins: [NetworkLoggerPlugin()]
    )
    
    func getMostPlayedSongs(completion: @escaping (Result<MostPlayedSongs, NetworkError>) ->()) {
        request(target: .getMostPlayedSongs, completion: completion)
    }

}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, NetworkError>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(NetworkError.serializationError(internal: error)))
                }
            case let .failure(error):
                completion(.failure(NetworkError.networkError(internal: error)))
            }
        }
    }
}
