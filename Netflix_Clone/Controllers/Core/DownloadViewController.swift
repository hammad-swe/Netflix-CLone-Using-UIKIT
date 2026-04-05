//
//  DownloadViewController.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 30/03/2026.
//

import UIKit

class DownloadViewController: UIViewController {
    
    
    private var titles: [TitleItem] = [TitleItem]()
    
    private let downloadTable: UITableView = {
       let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
        
        downloadTable.delegate = self
        downloadTable.dataSource = self
        
    }
    

   
}


extension DownloadViewController: UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            <#code#>
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            <#code#>
        }
        
    }

