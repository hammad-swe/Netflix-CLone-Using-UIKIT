//
//  SearchViewController.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 30/03/2026.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    private  var titles: [Title] = [Title]()
    
    private let discoverTable: UITableView = {
        let table = UITableView()
         table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
         return table
    }()
    
    
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultsViewController())
        controller.searchBar.placeholder = "Search For A Movie or Tv shows"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
        view.backgroundColor = .systemBackground
        view.addSubview(discoverTable)
        
        discoverTable.delegate = self
        discoverTable.dataSource = self
        navigationItem.searchController = searchController
        navigationController?.navigationBar.tintColor = .white
        
        fetchdiscoverMovies()
        
        searchController.searchResultsUpdater = self
        
    }
    
    private func  fetchdiscoverMovies(){
        APICaller.shared.getUpcommingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.discoverTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
    
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
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

extension SearchViewController:  UISearchResultsUpdating, SearchResultsViewControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let query = searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
              let resultsController = searchController.searchResultsUpdater as? SearchResultsViewController else {return}
        
        resultsController.delegate = self
        
        APICaller.shared.search(with: query) { result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let titles):
                    resultsController.titles = titles
                    resultsController.searchResultsCollectionView.reloadData()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    func searchResultsViewControllerDidTapItem(_ viewModel: TitlePreviewViewModel) {
        
        DispatchQueue.main.async { [weak self] in
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
