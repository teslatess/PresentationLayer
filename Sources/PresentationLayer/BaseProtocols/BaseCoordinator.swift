//
//  BaseCoordinator.swift
//  SPMTemplate
//
//  Created by tteslatess on 25.06.2024.
//

import UIKit

protocol BaseCoordinator: AnyObject {
    init(factory: Factory, navigationController: UINavigationController)

    func start()
}
