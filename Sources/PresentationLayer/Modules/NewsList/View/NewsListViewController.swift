//
//  TestVC.swift
//  SPMTemplate
//
//  Created by tteslatess on 25.06.2024.
//

import UIKit

public protocol NewsListView: BaseView {
    func update(with: [NewsViewModel])
}

public final class NewsListViewController: BaseViewController<NewsListView, NewsListPresenter> {
    
    // MARK: - UIComponents
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(cellType: NewsCell.self)
        
        tableView.backgroundColor = .black
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset.bottom = 50
            
        return tableView
    }()
    
    // MARK: - Layouts
    private let tableViewLayout = NewsListViewControllerLayouts.TableViewLayout()
    
    // MARK: - DataManager
    private let dataSource = NewsListTableViewDataSource()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupNavigationBar()
        setupLayout()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }

}

// MARK: - Private methods
extension NewsListViewController {
    
    private func setupLayout() {
        view.addSubview(tableView)
        tableViewLayout.initial(tableView)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        title = "Apple News"
    }
    
}

// MARK: - Interface methods
extension NewsListViewController: NewsListView {
    
    public func update(with news: [NewsViewModel]) {
        dataSource.update(news, tableView: tableView)
    }
    
}

