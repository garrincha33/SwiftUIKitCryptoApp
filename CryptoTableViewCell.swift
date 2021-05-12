//
//  CryptoTableViewCell.swift
//  SwiftUIKitCryptoApp
//
//  Created by Richard Price on 12/05/2021.
//

import UIKit
//step 7 create custom cell
class CryptoTableViewCell: UITableViewCell {
    static let identifier = "CryptoTableViewCell"
    
    private let nameLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return lable
    }()
    
    private let symbolLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return lable
    }()
    
    private let priceLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lable
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
