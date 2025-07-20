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
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(popToRootViewController),
                                           name: NSNotification.Name("isGifDone"),
                                           object: nil)
  }
  
  // MARK: - Private Function
  @objc
  private func popToRootViewController() {
    navigationController?.popToRootViewController(animated: true)
  }
}

// MARK: - Preview
import SwiftUI

#Preview {
  LoadingViewController()
}
