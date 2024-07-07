//
//  NewsViewModel.swift
//  SPMTemplate
//
//  Created by tteslatess on 07.07.2024.
//

import Foundation

public struct NewsViewModel {
    let title: String
    let description: String?
    let imageURL: URL?
    let author: String
    let content: String
    
    let didSelectNews: () -> Void
    let didReachNews: (Int) -> Void
    
}
