//
//  NewsListStateImpl.swift
//  SPMTemplate
//
//  Created by tteslatess on 02.07.2024.
//

import BusinessLayer

public final class NewsListStateImpl {
    private var currentPage: Int = 1
    private var totalPages: Int = 0
    
    private var newsList: [News] = []
    
    public init() {}
}

// MARK: - Interface
extension NewsListStateImpl: NewsListState {
    
    public func getCurrentPage() -> Int {
        return currentPage
    }
    
    public func incrementCurrentPage() {
        currentPage += 1
    }
    
    public func getTotalPages() -> Int {
        return totalPages
    }
    
    public func setTotalPages(pages: Int) {
        totalPages = pages
    }
    
    public func getNewsList() -> [News] {
        return newsList
    }
    
    public func setNewsList(list: [News]) {
        self.newsList.append(contentsOf: list)
    }
    
}

