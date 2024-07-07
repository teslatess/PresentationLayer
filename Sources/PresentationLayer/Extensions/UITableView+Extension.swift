//
//  UITableView+Extension.swift
//  SPMTemplate
//
//  Created by tteslatess on 06.07.2024.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type) {
        self.register(cellType, forCellReuseIdentifier: cellType.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath)
        return cell as! T
    }
    
}

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
