//
//  NewsListViewControllerLayouts.swift
//  SPMTemplate
//
//  Created by tteslatess on 06.07.2024.
//

import UIKit
import SnapKit

struct NewsListViewControllerLayouts {
    
    struct TableViewLayout {
        func initial(_ tableView: UIView) {
            guard let superview = tableView.superview else { return }
            
            tableView.snp.makeConstraints {
                $0.top.equalTo(superview.safeAreaLayoutGuide.snp.top)
                $0.bottom.equalToSuperview()
                $0.leading.equalToSuperview().offset(10)
                $0.trailing.equalToSuperview().offset(-10)
            }
        }
    }
    
}
