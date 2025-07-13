//
//  CalendarMainViewController.swift
//  JLife
//
//  Created by Hyun A Song on 7/13/25.
//

import UIKit

class CalendarMainViewController: UIViewController {
    override func loadView() {
        self.view = CalendarMainView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
}
