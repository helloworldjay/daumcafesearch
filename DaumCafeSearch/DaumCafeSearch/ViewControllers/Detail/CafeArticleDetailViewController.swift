//
//  CafeArticleDetailViewController.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import UIKit

final class CafeArticleDetailViewController: UIViewController {
  
  // MARK: Properties
  
  var detailView = CafeArticleDetailView()
  var article: CafeArticle?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view = self.detailView
  
    self.setDetailView()
    self.setURLButton()
  }
  
  private func setDetailView() {
    self.detailView.setData(with: self.article)
  }
  
  
  // MARK: URL Button
  
  private func setURLButton() {
    self.detailView.urlButton.addTarget(self, action: #selector(self.routeURL), for: .touchUpInside)
  }
  
  @objc private func routeURL(sender: UIButton) {
    guard let url = self.article?.url else { return }
    UIApplication.shared.open(url, options: [:])
  }
}
