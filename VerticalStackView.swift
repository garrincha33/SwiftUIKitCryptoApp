//
//  VerticalStackView.swift
//  SwiftUIKitCryptoApp
//
//  Created by Richard Price on 13/05/2021.
//


import UIKit

class VerticalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 5) {
        super.init(frame: .zero)
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .vertical
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
