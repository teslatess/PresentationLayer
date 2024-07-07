//
//  NewsListCoordinator.swift
//  SPMTemplate
//
//  Created by tteslatess on 25.06.2024.
//

import UIKit

public protocol NewsListCoordinator: AnyObject {
    func navigateToNewsDetails(with id: String?)
}

public final class NewsListCoordinatorImpl: BaseCoordinator {
    private let factory: Factory
    private let navigationController: UINavigationController
    
    // MARK: - Init
    public required init(
        factory: Factory,
        navigationController: UINavigationController
    ) {
        self.factory = factory
        self.navigationController = navigationController
    }
    
    // MARK: - Public methods
    public func start() {
        let newsViewController = factory.makeNewsListViewController(self)
        navigationController.viewControllers = [newsViewController]
    }
    
}

// MARK: - Interface
extension NewsListCoordinatorImpl: NewsListCoordinator {
    
    public func navigateToNewsDetails(with id: String?) {
        guard let id else {
            debugPrint("required id is empty")
            return
        }
        debugPrint("id: \(id)")
        // TODO: navigate to newsDetailsViewController
    }
    
}
