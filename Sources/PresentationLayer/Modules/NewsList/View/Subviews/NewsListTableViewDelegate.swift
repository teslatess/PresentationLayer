//
//  NewsListTableViewDelegate.swift
//  SPMTemplate
//
//  Created by tteslatess on 25.06.2024.
//

import UIKit

final class NewsListTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModel: [NewsViewModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
        cell.update(with: viewModel[indexPath.section])
        cell.backgroundColor = .black
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.black
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel[indexPath.section].didSelectNews()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel[indexPath.section].didReachNews(indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
}

// MARK: - Public methods
extension NewsListTableViewDataSource {
    
    public func update(_ viewModel: [NewsViewModel], tableView: UITableView) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
}
    
