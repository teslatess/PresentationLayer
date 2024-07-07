//
//  NewsCell.swift
//  SPMTemplate
//
//  Created by tteslatess on 25.06.2024.
//

import UIKit
import SnapKit

final class NewsCell: UITableViewCell {
    
    // MARK: - UIComponents
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 4
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Layouts
    private let imageViewLayout = NewsCellLayouts.ImageViewLayout()
    private let titleLabalLayout = NewsCellLayouts.TitleLabelLayout()
    private let descriptionLabelLayout = NewsCellLayouts.DescriptionLabelLayout()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var viewModel: NewsViewModel? {
        didSet {
            updateSubviews()
        }
    }
    
}

// MARK: - Public methods
extension NewsCell {
    
    public func update(with viewModel: NewsViewModel) {
        self.viewModel = viewModel
    }
    
}

// MARK: - Private methods
extension NewsCell {
    
    private func updateSubviews() {
        guard let viewModel else { return }
        
        titleLabel.text = viewModel.title
        
        let authorText = "🧑‍💻 Автор новости: \(viewModel.author)"
        
        if let description = viewModel.description, !description.isEmpty {
            descriptionLabel.text = "\(description) \n\n \(authorText)"
        } else {
            descriptionLabel.text = authorText
        }
        
        newsImageView.setImage(with: viewModel.imageURL)
    }
    
    private func setupLayout() {
        contentView.backgroundColor = .black
        
        contentView.addSubview(newsImageView)
        imageViewLayout.initial(newsImageView)
        
        contentView.addSubview(titleLabel)
        titleLabalLayout.initial(titleLabel, to: newsImageView)
        
        contentView.addSubview(descriptionLabel)
        descriptionLabelLayout.initial(descriptionLabel, to: newsImageView)
    }
    
}
