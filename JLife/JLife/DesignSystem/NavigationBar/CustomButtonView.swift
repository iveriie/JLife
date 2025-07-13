//
//  CustomButtonView.swift
//  JLife
//
//  Created by Hyun A Song on 7/13/25.
//

import UIKit

public struct CustomButtonView {
    public var title: String?
    public var image: UIImage?
    public var isEnabled: Bool
    public var isTouchable: Bool
    public var enabledColor: UIColor?
    public var disabledColor: UIColor?
    public var buttonAction: (() -> Void)?
    
    public init(
        title: String? = nil,
        image: UIImage? = nil,
        isEnabled: Bool = true,
        isTouchable: Bool = false,
        enabledColor: UIColor? = nil,
        disabledColor: UIColor? = nil,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.image = image
        self.isEnabled = isEnabled
        self.isTouchable = isTouchable
        self.enabledColor = enabledColor
        self.disabledColor = disabledColor
        self.buttonAction = action
    }
    
    public static func none() -> CustomButtonView {
        return CustomButtonView(isEnabled: false)
    }

    public static func image(
        image: UIImage,
        isEnabled: Bool = true,
        isTouchable: Bool = false,
        action: (() -> Void)? = nil
    ) -> CustomButtonView {
        return CustomButtonView(
            image: image,
            isEnabled: isEnabled,
            isTouchable: isTouchable,
            action: action
        )
    }
    
    public static func text(
        title: String,
        isEnabled: Bool = true,
        isTouchable: Bool = false,
        action: (() -> Void)? = nil
    ) -> CustomButtonView {
        return CustomButtonView(
            title: title,
            isEnabled: isEnabled,
            isTouchable: isTouchable,
            action: action
        )
    }

    public static func coloredText(
        title: String,
        enabledColor: UIColor,
        disabledColor: UIColor,
        isEnabled: Bool = true,
        action: (() -> Void)? = nil
    ) -> CustomButtonView {
        return CustomButtonView(
            title: title,
            isEnabled: isEnabled,
            enabledColor: enabledColor,
            disabledColor: disabledColor,
            action: action
        )
    }

    var isButtonEnabled: Bool {
        return isEnabled || isTouchable
    }

    var isAlwaysTouchable: Bool {
        return isTouchable
    }

    func asUIButton() -> UIButton {
        let button = UIButton(type: .system)

        if let title = title {
            button.setTitle(title, for: .normal)
            button.setTitleColor((isEnabled ? enabledColor : disabledColor) ?? .label, for: .normal)
        }

        if let image = image {
            button.setImage(image, for: .normal)
        }

        button.isEnabled = isButtonEnabled
        button.tintColor = isEnabled ? (enabledColor ?? .label) : (disabledColor ?? .lightGray)

        if let action = buttonAction {
            button.addAction(UIAction(handler: { _ in action() }), for: .touchUpInside)
        }

        return button
    }
}
