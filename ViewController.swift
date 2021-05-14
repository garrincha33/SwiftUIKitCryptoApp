//
//  ViewController.swift
//  SwiftUIKitCryptoApp
//
//  Created by Richard Price on 10/05/2021.
//

import UIKit
// API caller
//UI to show different crpytos
//MVVM pattern

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
    }()
    private var viewModels = [CryptoTableViewCellViewModel]()
    //step 4 create a number formatter
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getCryptos()
    }
    private func setupUI() {
        title = ""
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Crypto Tracker"
        navigationController?.navigationBar.barTintColor = .systemGray
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func getCryptos() {
        APICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({
                    //number formatter //step 5 use number formatter
                    let price = $0.price_usd ?? 0
                    let formatter = ViewController.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))
                    return CryptoTableViewCellViewModel(name: $0.name ?? "", symbol: $0.asset_id, price: priceString ?? "N/A")
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
        //FIXES GAP AT TOP
        tableView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0);
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }

        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    //step 2 increase height of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

