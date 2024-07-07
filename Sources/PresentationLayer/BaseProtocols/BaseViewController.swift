//
//  BaseViewController.swift
//  SPMTemplate
//
//  Created by tteslatess on 02.07.2024.
//

import UIKit

public protocol BaseView: AnyObject {
    func startLoading()
    func stopLoading()
    func showError(with title: String, and message: String)
}

public class BaseViewController<ViewProtocol, Presenter>: UIViewController, BaseView where Presenter: BasePresenter<ViewProtocol> {
    // MARK: - Properties
    public let presenter: Presenter
    
    // MARK: - Init
    public init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Override method
    public func setupUI() {}
    
}

// MARK: - Interface
extension BaseViewController {
    
    public func startLoading() {
        showLoader()
    }
    
    public func stopLoading() {
        hideLoader()
    }
    
    public func showError(with title: String, and message: String) {
        showAlert(with: title, and: message)
    }
    
}
