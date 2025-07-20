//
//  LoadingView.swift
//  jlife
//
//  Created by OoO on 7/16/25.
//

import UIKit
import Gifu

final class LoadingView: UIView {
  
  private let gifView: GIFImageView = {
    let image = GIFImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.contentMode = .scaleAspectFit
    
    return image
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpUI()
  }
  
  required init(coder: NSCoder) {
    fatalError( "init(coder:) has not been implemented" )
  }
  
  private func setUpUI(){
    backgroundColor = .white
    setViewHierarchy()
    setConstraints()
    configureImage()
  }
  
  private func setViewHierarchy() {
    addSubview(gifView)
  }
  
  private func setConstraints() {
    NSLayoutConstraint.activate([
      gifView.centerXAnchor.constraint(equalTo: centerXAnchor),
      gifView.centerYAnchor.constraint(equalTo: centerYAnchor),
      gifView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
      gifView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
      gifView.heightAnchor.constraint(equalTo: gifView.widthAnchor)
    ])
  }
  
  private func configureImage() {
    gifView.animate(withGIFNamed: "JLifeLogo",
                    loopCount: 1,
                    loopBlock: {
      NotificationCenter.default.post(name: NSNotification.Name("isGifDone"),
                                      object: nil)
    })
  }
  
}
