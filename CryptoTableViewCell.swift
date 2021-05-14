//
//  CryptoTableViewCell.swift
//  SwiftUIKitCryptoApp
//
//  Created by Richard Price on 12/05/2021.
//

import UIKit

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
        lable.textColor = .systemRed
        lable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return lable
    }()
    
    private let priceLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .systemGreen
        lable.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lable
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(symbolLable)
        contentView.addSubview(nameLable)
        contentView.addSubview(priceLable)
        let stackView = UIStackView(arrangedSubviews: [symbolLable, nameLable, priceLable])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        //step 1 adjust stackview
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        nameLable.sizeToFit()
        priceLable.sizeToFit()
        symbolLable.sizeToFit()
    }

    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLable.text = viewModel.name
        priceLable.text = viewModel.price
        symbolLable.text = viewModel.symbol
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
