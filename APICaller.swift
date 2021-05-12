//
//  APICaller.swift
//  SwiftUIKitCryptoApp
//
//  Created by Richard Price on 12/05/2021.
//

import Foundation
//step 1 create am api caller class and get free api key from coinAPI.io
final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let key = "9D27B520-A4E5-472B-B090-1B946DAA3B4F"
        static let assetsEndpoint = "https://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    private init() {}
    
    public func getAllCryptoData(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = URL(string: Constants.assetsEndpoint + "?apikey=" + Constants.key) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
                //decode response
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    
    
}
