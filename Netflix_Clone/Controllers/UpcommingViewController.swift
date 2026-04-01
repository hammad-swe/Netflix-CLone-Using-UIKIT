//
//  UpcommingViewController.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 30/03/2026.
//

import UIKit

class UpcommingViewController: UIViewController {

 private  var titles: [Title] = [Title]()
    
    private let upcommingTable: UITableView = {
       let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
        
        view.addSubview(upcommingTable)
        
        upcommingTable.delegate = self
        upcommingTable.dataSource = self
        fetchUpcomming()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcommingTable.frame = view.bounds
    }
    
    private func  fetchUpcomming(){
        APICaller.shared.getUpcommingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcommingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    

}

extension UpcommingViewController:  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell  = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as?
        TitleTableViewCell  else {
            return UITableViewCell()
        }
        
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "Unknown", posterURL: title.poster_path ?? "Unkown"))
        return cell
       
        
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}
