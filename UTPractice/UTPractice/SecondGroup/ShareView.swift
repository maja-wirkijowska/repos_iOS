//
//  ShareView.swift
//  UTPractice
//
//  Created by Maja Wirkijowska on 7/26/22.
//

import SwiftUI

class ShareView: UIView {
  var shareAction: (String) -> Void
  var textField: UITextField!
  
  init(shareAction: @escaping (String) -> Void) {
    self.shareAction = shareAction
    super.init(frame: .zero)
    
    let textField = UITextField()
    textField.sizeToFit()
    addSubview(textField)
    
    let button = UIButton(type: .system)
    button.sizeToFit()
    button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
    addSubview(button)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) is not supported")
  }
  
  @objc func shareTapped() {
    guard let text = textField.text else { return }
    
    shareAction(text)
  }
}

class ShareViewController: UIViewController {
  override func loadView() {
    view = ShareView { [weak self] in
      self?.shareContent(text: $0)
    }
  }
  
  func shareContent(text: String) {
    print("Sharing content...")
  }
}

struct URLHandler {
  typealias URLOpening = (URL, [UIApplication.OpenExternalURLOptionsKey: Any], ((Bool) -> Void)?) -> Void
  
  let urlOpener: URLOpening  = UIApplication.shared.open
  
  func open(url: URL) {
    if url.absoluteString.hasPrefix("internal://") {
      // some action
    } else {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
  }
}
