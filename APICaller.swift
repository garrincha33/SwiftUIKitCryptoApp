//
//  APICaller.swift
//  SwiftUIKitCryptoApp
//
//  Created by Richard Price on 12/05/2021.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let key = "9D27B520-A4E5-472B-B090-1B946DAA3B4F"
        static let assetsEndpoint = "https://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    private init() {}
    //step 2 add Cryptos to result type and decode
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
        guard let url = URL(string: Constants.assetsEndpoint + "?apikey=" + Constants.key) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                completion(.success(cryptos))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
