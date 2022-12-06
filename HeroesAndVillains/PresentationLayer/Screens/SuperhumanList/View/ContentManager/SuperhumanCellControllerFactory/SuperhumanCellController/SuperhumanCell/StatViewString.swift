//
//  StatViewString.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 02.11.2022.
//

import Foundation
import UIKit

// MARK: - StatViewString

final class StatViewString: UIView {
    
    // Label with superhuman's stat value
    private let statValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .right
        return label
    }()
    
    // Label with superhuman's stat name
    private let statNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
        design()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Useful
    
    public func setupText(statValue: Int, statName: String) {
        statValueLabel.text = String(statValue)
        statNameLabel.text = statName
    }
}

// MARK: - StatViewString

extension StatViewString {
    
    private func setupLayout() {
        setupStatValueLabel()
        setupStatNameLabel()
    }
    private func setupStatValueLabel() {
        statValueLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statValueLabel)
        statValueLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statValueLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        statValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    private func setupStatNameLabel() {
        statNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statNameLabel)
        statNameLabel.leftAnchor.constraint(equalTo: statValueLabel.leftAnchor, constant: LayoutConstants.betweenStatSpacing).isActive = true
        statNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        statNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

// MARK: - Design

extension StatViewString {
    
    private func design() {
        statValueLabel.textColor = .white
        statNameLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.38)
    }
}

// MARK: - Constans

extension StatViewString {
    
    enum LayoutConstants {
        static let betweenStatSpacing: CGFloat = 32
    }
}
