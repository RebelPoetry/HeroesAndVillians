//
//  StatViewString.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 02.11.2022.
//

import Foundation
import UIKit

// MARK: - StatView

final class StatView: UIView {
    
    // Label with superhuman's stat value
    private let statValueLabel: UILabel = {
        
        let value = UILabel()
        value.textAlignment = .right
        return value
    }()
    
    // Label with superhuman's stat name
    private let statNameLabel = UILabel()
    
    init(value: Int, name: String) {
        self.statValueLabel.text = String(value)
        self.statNameLabel.text = name
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

// MARK: - StatView

extension StatView {
    
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

extension StatView {
    
    private func design() {
        statValueLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        statValueLabel.textColor = .white
        statNameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        statNameLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.38)
    }
}

// MARK: - Constans

extension StatView {
    
    enum LayoutConstants {
        static let betweenStatSpacing: CGFloat = 32
    }
}
