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
    
    var resultsMain: [Result] = []
    
    private let cellMovie = "CellMovie"
    
    private var model: [CellMovieProtocol] = []
    
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
        
        tableView.register(CellMovie.self, forCellReuseIdentifier: cellMovie)
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
        resultsMain.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellMovie) as? CellMovie
        print("model \(model)")
        let viewModel = model[indexPath.row]
        cell?.configure(viewModel as! CellMovieModel)
        return cell ?? UITableViewCell()
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
        let text = uiSearchBar.text
        
        //DispatchQueue.main.async {

        apiManeger.getImdbResults(
            url: apiManeger.getImdbURL(searchTitle: text!) ,
            completion: {
                [self] results in
                self.resultsMain = results
                return
            })
        
        
        print("ResultMain \(resultsMain)")
        
        if resultsMain.count != 0 {
            model = []
            
        for i in 0...(resultsMain.count-1) {
            model.append(CellMovieModel(
                title: resultsMain[i].title,
                description: resultsMain[i].resultDescription,
                image: UIImage()
            )
            )
          }
            
        } else {
            print("Массив пустой")
        }
        
        //}
            tableView.reloadData()
        //print("Результат в виев контроллере \(resultsMain)")
    }
    
}

