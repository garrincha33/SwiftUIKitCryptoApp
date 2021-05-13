//
//  Crypto.swift
//  SwiftUIKitCryptoApp
//
//  Created by Richard Price on 12/05/2021.
//

import Foundation
//step 1 create your crypto models
struct Crypto: Codable {
    let asset_id: String
    let name: String?
    let price_usd: Float?
    let id_icon: String?
}
