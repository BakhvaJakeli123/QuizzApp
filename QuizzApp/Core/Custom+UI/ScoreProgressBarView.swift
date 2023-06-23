//
//  ScoreProgressBarView.swift
//  QuizzApp
//
//  Created by Bakhva Jakeli on 23.06.23.
//

import UIKit

final class ScoreProgressBarView: UIView {
    
    // MARK: Components
    private let onGoingLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.onGoingScoreLabelText
        label.font = .systemFont(ofSize: Constants.onGoingLabelFont)
        label.textColor = QuizzAppColors.buttonColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let onGoingScoreLabel: UILabel = {
        let labal = UILabel()
        labal.font = .boldSystemFont(ofSize: Constants.onGoingLabelFont)
        labal.textColor = QuizzAppColors.buttonColor
        labal.text = "-1 ★"
        
        return labal
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: Constants.countLabelFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .blue
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        return progressView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(onGoingLabel)
        stackView.addArrangedSubview(onGoingScoreLabel)
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateProgessBar(count: Int, total: Int) {
        let progress = Float(count) / Float(total)
        progressBar.progress = progress
        countLabel.text = "\(count)/\(total)"
    }
}

// MARK: -Private Functions
private extension ScoreProgressBarView {
    // MARK: Add Sub Views
    func addViews() {
        addSubview(countLabel)
        addSubview(stackView)
        addSubview(progressBar)
    }
    
    // MARK: Add Constraints
    func constraints() {
        countLabelConstraints()
        stackViewConstraints()
        progressBarConstraints()
    }
    
    // MARK: Count Label Constraints
    func countLabelConstraints() {
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: topAnchor),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    // MARK: Stack View Constraints
    func stackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: Progress Bar Constraints
    func progressBarConstraints() {
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: countLabel.bottomAnchor,
                                             constant: Constants.progressBarTopPadding),
            progressBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressBar.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: -Constants
private extension ScoreProgressBarView {
    enum Constants {
        static let onGoingScoreLabelText = "მიმდინარე ქულა"
        static let onGoingLabelFont: CGFloat = 12
        static let countLabelFont: CGFloat = 14
        static let progressBarTopPadding: CGFloat = 5
    }
}
