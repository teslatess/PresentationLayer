//
//  NewsListState.swift
//  SPMTemplate
//
//  Created by tteslatess on 02.07.2024.
//

import BusinessLayer

public protocol NewsListState {
    func getCurrentPage() -> Int
    mutating func incrementCurrentPage()
    
    func getNewsList() -> [News]
    mutating func setNewsList(list: [News])
    
    func getTotalPages() -> Int
    mutating func setTotalPages(pages: Int)
}
