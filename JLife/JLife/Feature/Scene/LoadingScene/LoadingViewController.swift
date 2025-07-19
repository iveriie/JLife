//
//  LoadingViewController.swift
//  jlife
//
//  Created by OoO on 7/16/25.
//

import UIKit

class LoadingViewController: UIViewController {

  private let loadingView = LoadingView()
  
  override func loadView() {
    view = loadingView
  }
  
    override func viewDidLoad() {
    }
}

// MARK: - Preview
import SwiftUI

#Preview {
  LoadingViewController()
}
