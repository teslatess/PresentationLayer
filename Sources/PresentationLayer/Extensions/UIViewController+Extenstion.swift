//
//  UIViewController+Extenstion.swift
//  SPMTemplate
//
//  Created by tteslatess on 02.07.2024.
//

import UIKit

extension UIViewController {
    
    func showLoader() {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = .white
        indicatorView.startAnimating()
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.tag = 777
        self.view.addSubview(indicatorView)
        indicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func hideLoader() {
        if let subViews = view.viewWithTag(777) {
            subViews.removeFromSuperview()
        }
    }
    
}

extension UIViewController {
    
    func showAlert(with title: String, and message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(cancel)
        
        present(alertController, animated:true, completion: {
            guard let callback = completion else { return }
            DispatchQueue.main.async {
                callback()
            }
        })
    }
    
}
