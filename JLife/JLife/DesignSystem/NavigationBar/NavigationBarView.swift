//
//  NavigationBarView.swift
//  JLife
//
//  Created by Hyun A Song on 7/13/25.
//

import UIKit

public class ALNavigationBarView: UIView {
    // MARK: - Types
    public enum LeftType {
        case none
        case button(CustomButtonView)
    }
    
    public enum CenterType {
        case none
        case title(text: String)
    }
    
    public enum RightType {
        case none
        case button(CustomButtonView)
        case horizontalButtons(buttons: [CustomButtonView])
    }
    
    // MARK: - Properties
    private let leftType: LeftType
    private let centerType: CenterType
    private let rightType: RightType
    
    public var leftAction: (() -> Void)?
    public var rightAction: (() -> Void)?
    
    private let leftContainer = UIView()
    private let centerContainer = UIView()
    private let rightContainer = UIStackView()
    
    // MARK: - Init
    public init(left: LeftType = .none,
                center: CenterType = .none,
                right: RightType = .none) {
        self.leftType = left
        self.centerType = center
        self.rightType = right
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    private func setupView() {
        backgroundColor = .clear
        
        let mainStack = UIStackView(arrangedSubviews: [leftContainer, centerContainer, rightContainer])
        mainStack.axis = .horizontal
        mainStack.alignment = .center
        mainStack.distribution = .equalCentering
        mainStack.spacing = 8
        addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            centerContainer.centerXAnchor.constraint(equalTo: mainStack.centerXAnchor)
        ])
        
        configureLeftView()
        configureCenterView()
        configureRightView()
    }
    
    // MARK: - Left View
    private func configureLeftView() {
        leftContainer.subviews.forEach { $0.removeFromSuperview() }
        
        switch leftType {
        case .none:
            leftContainer.widthAnchor.constraint(equalToConstant: 32).isActive = true
        case .button(let button):
            let btn = button.asUIButton()
            btn.addTarget(self, action: #selector(handleLeftAction), for: .touchUpInside)
            leftContainer.addSubview(btn)
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.centerYAnchor.constraint(equalTo: leftContainer.centerYAnchor),
                btn.leadingAnchor.constraint(equalTo: leftContainer.leadingAnchor),
                btn.trailingAnchor.constraint(equalTo: leftContainer.trailingAnchor)
            ])
        }
    }
    
    // MARK: - Center View
    private func configureCenterView() {
        centerContainer.subviews.forEach { $0.removeFromSuperview() }
        
        switch centerType {
        case .none:
            break
        case .title(let text):
            let label = UILabel()
            label.text = text
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            label.textColor = .label
            centerContainer.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: centerContainer.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: centerContainer.centerYAnchor)
            ])
        }
    }
    
    // MARK: - Right View
    private func configureRightView() {
        rightContainer.subviews.forEach { $0.removeFromSuperview() }
        rightContainer.axis = .horizontal
        rightContainer.spacing = 12
        rightContainer.alignment = .center
        
        switch rightType {
        case .none:
            rightContainer.widthAnchor.constraint(equalToConstant: 32).isActive = true
        case .button(let button):
            let btn = button.asUIButton()
            btn.addTarget(self, action: #selector(handleRightAction), for: .touchUpInside)
            rightContainer.addArrangedSubview(btn)
        case .horizontalButtons(let buttons):
            for button in buttons.prefix(4) {
                let btn = button.asUIButton()
                btn.addTarget(self, action: #selector(handleRightAction), for: .touchUpInside)
                rightContainer.addArrangedSubview(btn)
            }
        }
    }
    
    // MARK: - Actions
    @objc private func handleLeftAction() {
        leftAction?()
    }

    @objc private func handleRightAction() {
        rightAction?()
    }
}

#Preview {
    ALNavigationBarView(left: .button(.coloredText(title: "Test", enabledColor: .black, disabledColor: .blue)))
}
