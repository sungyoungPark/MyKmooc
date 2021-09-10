//
//  ViewController.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/05.
//

import UIKit
import SnapKit

class KmoocListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = KmoocListViewModel()
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "K-Mooc"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (maker) in
            maker.top.bottom.leading.trailing.equalTo(0)
        }
        
        viewModel.listUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.listUP()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.classesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ClassTableViewCell()
        cell.drawCell(myClass: viewModel.indexClass(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let celClass = viewModel.indexClass(indexPath: indexPath)
    }
}

