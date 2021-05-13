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
    //step 8 view model ref
    private var viewModels = [CryptoTableViewCellViewModel]()

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
        //step 9 weak self
        APICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({
                    //number formatter //step 10 enter your viewmodel and compact map to bind model
                    CryptoTableViewCellViewModel(name: $0.name ?? "", symbol: $0.asset_id, price: "£1")
                })
                //step 11 dispatch quewue to relad
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
        //step 12 viewmodels count to get actual numbers
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        //step 13 use our configure cell modethod to get the index patth row
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
}

