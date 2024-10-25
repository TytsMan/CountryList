//
//  CountriesListCell.swift
//  CountriesList
//
//  Created by divan on 10/22/24.
//

import UIKit
import SnapKit

final class CountriesListCell: UITableViewCell {
    
    private lazy var countryNameLabel: UILabel = {
        UILabel()
    }()
    
    private lazy var regionLabel: UILabel = {
        UILabel()
    }()
    
    private lazy var codeLabel: UILabel = {
        UILabel()
    }()
    
    private lazy var capitalNameLabel: UILabel = {
        UILabel()
    }()
    
    // MARK: Init/Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    
        countryNameLabel.text = nil
        codeLabel.text = nil
        capitalNameLabel.text = nil
    }
    
    // MARK: Setup
    
    private func setupUI() {
        let lineStackView = UIStackView(
            arrangedSubviews: [
                countryNameLabel,
                codeLabel
            ]
        )
        lineStackView.axis = .horizontal
        lineStackView.spacing = 8
        let stackView = UIStackView(arrangedSubviews: [
            lineStackView,
            capitalNameLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    func configure(with viewModel: ViewModel) {
        countryNameLabel.text = "\(viewModel.countryName), \(viewModel.region)"
        codeLabel.text = viewModel.code
        capitalNameLabel.text = viewModel.capitalName
    }
}

#if DEBUG

#Preview {
    let cell = CountriesListCell()
    cell.configure(
        with: .init(
            countryName: "Albanie",
            region: "EU",
            code: "qq",
            capitalName: "Aleban"
        )
    )
    return cell
}

#endif
