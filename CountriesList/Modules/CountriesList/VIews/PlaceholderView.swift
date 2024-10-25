//
//  PlaceholderView.swift
//  CountriesList
//
//  Created by divan on 10/25/24.
//

import UIKit
import SnapKit

final class PlaceholderView: UIView {
    struct ViewModel: Hashable {
        let title: String
        let text: String
        let image: String
    }
    
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var textLabel = UILabel()
    
    init(viewModel: ViewModel) {
        super.init(frame: .zero)
        
        setupUI()
        configire(with: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        titleLabel.textAlignment = .center
        textLabel.textAlignment = .center
        let stackView = UIStackView(arrangedSubviews: [
            imageView.wrapped,
            titleLabel,
            textLabel,
        ])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        let container = stackView.wrapped
        
        addSubview(container)
        container.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview().inset(4)
        }
    }
    
    func configire(with viewModel: ViewModel) {
        imageView.image = UIImage(systemName: viewModel.image)
        titleLabel.text = viewModel.title
        textLabel.text = viewModel.text
    }
}
