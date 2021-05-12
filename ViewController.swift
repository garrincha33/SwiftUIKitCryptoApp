//
//  ViewController.swift
//  SwiftUIKitCryptoApp
//
//  Created by Richard Price on 10/05/2021.
//

import UIKit
//step 2
//create a tableview controller to display cryptos

// API caller
//UI to show different crpytos
//MVVM pattern

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //step 3 create a closure tableview
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //step 4 create a setup ui func
    private func setupUI() {
        title = ""
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Crypto Tracker"
        navigationController?.navigationBar.barTintColor = .systemGray
        navigationController?.navigationBar.isTranslucent = false
    }
    //step 5 call layout suviews
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
        //FIXES GAP AT TOP
        tableView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0);
    }
    
    //step 6 tablview funcs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        cell.textLabel?.text = "Hey Testing"
        return cell
    }
}

