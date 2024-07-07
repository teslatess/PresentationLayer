//
//  NewsCellLayouts.swift
//  SPMTemplate
//
//  Created by tteslatess on 07.07.2024.
//

import UIKit
import SnapKit

struct NewsCellLayouts {
    
    struct ImageViewLayout {
        func initial(_ imageView: UIView) {
            guard imageView.superview != nil else { return }
            imageView.snp.makeConstraints {
                $0.top.leading.equalToSuperview().offset(10)
                $0.width.equalTo(160)
                $0.height.equalTo(90)
            }
        }
    }

    struct TitleLabelLayout {
        func initial(_ titleLabel: UIView, to imageView: UIView) {
            guard titleLabel.superview != nil else { return }
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(10)
                $0.leading.equalTo(imageView.snp.trailing).offset(10)
                $0.trailing.equalToSuperview().offset(-10)
            }
        }
    }
    
    struct DescriptionLabelLayout {
        func initial(_ descriptionLabel: UIView, to imageView: UIView) {
            guard descriptionLabel.superview != nil else { return }
            
            descriptionLabel.snp.makeConstraints {
                $0.leading.equalTo(imageView)
                $0.trailing.equalToSuperview().offset(-10)
                $0.top.equalTo(imageView.snp.bottom).offset(10)
                $0.bottom.equalToSuperview().offset(-10)
            }
        }
    }
    
}
