//
//  ViewController.swift
//  M18Homework
//
//  Created by Евгений Бурдюжа on 08.01.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var apiManeger = APImanager()
    
    var result: [Result] = []
    
    private let cellWithImageHeaderTitle = "СellWithImageHeaderTitle"
    
    private lazy var uiSearchBar: UISearchBar = {
       let uiSearchBar = UISearchBar()
       return uiSearchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.separatorStyle = .singleLine
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellWithImageHeaderTitle)
        tableView.dataSource = self
        
        uiSearchBar.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(uiSearchBar)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        uiSearchBar.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(50)
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { maker in
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.top.equalTo(uiSearchBar.snp.bottom)
            maker.bottom.equalToSuperview()
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = uiSearchBar.text
        //print("search text \(text)")
        result = apiManeger.getImdbResults(searchTitle: text!)
        print(result.count)
        //print(result)
        //print("search button")
        tableView.reloadData()
    }
    
}

