//
//  DependencyFactory.swift
//  SPMTemplate
//
//  Created by tteslatess on 25.06.2024.
//

import NetworkingLayer
import BusinessLayer

public protocol Factory {
    func makeNewsListViewController(_ coordinator: NewsListCoordinator) -> NewsListViewController
}

public final class DependencyFactory: Factory {
    private let urlSessionClient = URLSessionClientImpl()
    private let newsResponseMapper = NewsResponseMapper()
    
    public func makeNewsListViewController(_ coordinator: NewsListCoordinator) -> NewsListViewController {
        let popularNewsService = PopularNewsServiceImpl(apiClient: urlSessionClient)
        let popularNewsUseCase = PopularNewsUseCaseImpl(
            networkService: popularNewsService,
            responseMapper: newsResponseMapper
        )
        
        let state = NewsListStateImpl()
        let presenter = NewsListPresenter(
            coordinator: coordinator,
            state: state,
            popularNewsUseCase: popularNewsUseCase
        )
        
        let viewController = NewsListViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
    public init() {}
    
}
