//
//  CafeSearchListViewController.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import UIKit
import SwiftUI

import Then

final class CafeSearchListViewController: UIViewController {
  
  // MARK: Properties
  
  let searchBar = SearchBar()
  let cafeArticleListView = CafeListView()
  let activity = UIActivityIndicatorView().then {
    $0.tintColor = .daumCafeColor
  }
  var searchKeyword = ""
  var viewModel: CafeSearchViewModelLogic?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
  
  // MARK: Button Action
  
  private func setSearchBarButton() {
    self.searchBar.searchButton.addTarget(self, action: #selector(self.searchCafeArticle), for: .touchUpInside)
  }
  
  @objc private func searchCafeArticle(sender: UIButton) {
    self.searchKeyword = self.searchBar.text ?? ""
    self.loadList()
  }


// MARK: - Preview

struct MainViewController_Previews: PreviewProvider {
  static var previews: some View {
    Container().edgesIgnoringSafeArea(.all)
  }
  
  struct Container: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
      let rootViewController = CafeSearchListViewController()
      return UINavigationController(rootViewController: rootViewController)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    typealias UIViewControllerType = UIViewController
  }
}
