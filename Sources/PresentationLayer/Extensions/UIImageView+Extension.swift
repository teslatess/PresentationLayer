//
//  UIImageView+Extension.swift
//  SPMTemplate
//
//  Created by tteslatess on 06.07.2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: URL?) {
        guard let url else { return }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, options: [.transition(.fade(0.3))])
    }
    
}
