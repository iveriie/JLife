//
//  CalendarMainView.swift
//  JLife
//
//  Created by Hyun A Song on 7/13/25.
//

import UIKit

class CalendarMainView: UIView {
    let navigationBar = ALNavigationBarView(left: .button(.coloredText(title: "Back", enabledColor: .blue, disabledColor: .brown)))
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
