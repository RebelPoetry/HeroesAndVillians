//
//  SuperhumanCell.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 09.10.2022.
//

import Foundation
import UIKit
import Kingfisher

// MARK: SuperhumanCell

final public class SuperhumanCell: UITableViewCell {
    
    /// General cell container
    private let containerView = UIView()
    
    /// Container with superhuman's info
    private let infoContainerView = UIView()
    
    /// Favorite button instance
    private let favoriteButton = UIButton()
    
    /// Header instance
    private let headerLabel: UILabel =  {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    /// Stack with superhuman's stats
    private let statsStackView: UIStackView =  {
        let stackView = UIStackView()
        stackView.spacing = CGFloat(1.3)
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    /// Superhuman's image instance
    private let cellImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: - UITableViewCell
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        design()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Useful
    
    func setupStats(with stats: [SuperhumanStatPlainObject]) {
        if statsStackView.subviews.isEmpty {
            for stat in stats {
                let statView = StatView()
                statView.setupText(statValue: stat.value, statName: stat.shortName)
                statsStackView.addArrangedSubview(statView)
            }
        }
    }
    
    func setup(with viewModel: SuperhumanCellViewModelProtocol) {
        headerLabel.text = viewModel.name
        setupStats(with: viewModel.stats)
        favoriteButton.setImage(UIImage(named: "unfilledStar") , for: .normal)
        cellImage.kf.setImage(with: viewModel.imageURL)
        infoContainerView.backgroundColor = UIColor(hex: viewModel.backgroundColorHex)
    }
}

// MARK: - Layout

public extension SuperhumanCell {
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        infoContainerView.smoothCorners(radius: 24)
    }
    
    private func setupLayout() {
        setupContainerView()
        setupInfoContainerView()
        setupFavoriteButton()
        setupStatsStackView()
        setupHeaderLabel()
        setupImageView()
    }
    
    private func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: LayoutConstants.containerViewBottomPadding).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: LayoutConstants.containerViewHeight).isActive = true
    }
    
    private func setupInfoContainerView() {
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(infoContainerView)
        infoContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        infoContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        infoContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        infoContainerView.heightAnchor.constraint(equalToConstant: LayoutConstants.infoContainerViewHeight).isActive = true
    }
    
    private func setupFavoriteButton() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(favoriteButton)
        favoriteButton.leftAnchor.constraint(equalTo: infoContainerView.leftAnchor, constant: LayoutConstants.favoriteButtonLeftPadding).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: LayoutConstants.favoriteButtonTopPadding).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: LayoutConstants.favoriteButtonHeight).isActive = true
    }
    
    private func setupStatsStackView() {
        statsStackView.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(statsStackView)
        statsStackView.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor, constant: LayoutConstants.statsStackViewBottomPadding).isActive = true
        statsStackView.leftAnchor.constraint(equalTo: infoContainerView.leftAnchor, constant: LayoutConstants.statsStackViewLeftPadding).isActive = true
    }
    
    private func setupHeaderLabel() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(headerLabel)
        headerLabel.leftAnchor.constraint(equalTo: favoriteButton.rightAnchor, constant: LayoutConstants.headerLabelLeftPadding).isActive = true
        headerLabel.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: LayoutConstants.headerLabelTopPadding).isActive = true
    }
    
    private func setupImageView() {
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(cellImage)
        cellImage.rightAnchor.constraint(equalTo: infoContainerView.rightAnchor, constant: LayoutConstants.cellImageRightPadding).isActive = true
        cellImage.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: LayoutConstants.cellImageTopPadding).isActive = true
        cellImage.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor, constant: LayoutConstants.cellImageBottomPadding).isActive = true
        cellImage.widthAnchor.constraint(equalToConstant: LayoutConstants.cellImageWidth).isActive = true
    }
}

// MARK: - Design

extension SuperhumanCell {
    
    private func design() {
        headerLabel.textColor = .white
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}

// MARK: - Constants

extension SuperhumanCell {
    
    enum LayoutConstants {
        static let containerViewBottomPadding: CGFloat = -8
        static let containerViewHeight: CGFloat = 208
        static let infoContainerViewHeight: CGFloat = 196
        static let favoriteButtonLeftPadding: CGFloat = 8
        static let favoriteButtonTopPadding: CGFloat = 12
        static let favoriteButtonHeight: CGFloat = 30
        static let statsStackViewBottomPadding: CGFloat = -10
        static let statsStackViewLeftPadding: CGFloat = 10
        static let headerLabelLeftPadding: CGFloat = 10
        static let headerLabelTopPadding: CGFloat = 14
        static let cellImageRightPadding: CGFloat = -16
        static let cellImageTopPadding: CGFloat = 16
        static let cellImageBottomPadding: CGFloat = -16
        static let cellImageWidth: CGFloat = 164
    }
}
