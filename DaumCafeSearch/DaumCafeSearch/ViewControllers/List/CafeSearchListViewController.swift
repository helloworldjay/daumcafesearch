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
  
  
  // MARK: Initializers
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.attribute()
    self.layout()
    self.configure()
  }
  
  private func attribute() {
    self.navigationItem.title = "Daum ์นดํ ๊ฒ์"
    self.view.backgroundColor = .white
  }
  
  private func layout() {
    [self.searchBar, self.cafeArticleListView, self.activity].forEach { self.view.addSubview($0) }
    
    self.searchBar.snp.makeConstraints {
      $0.top.equalToSuperview().offset(100)
      $0.leading.trailing.equalToSuperview()
    }
    
    self.cafeArticleListView.snp.makeConstraints {
      $0.top.equalTo(searchBar.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    
    self.activity.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  private func configure() {
    self.viewModel = CafeSearchViewModel()
    self.viewModel?.repository = CafeSearchRepository()
    self.viewModel?.repository?.networkManager = NetworkManager()
    
    self.cafeArticleListView.dataSource = self
    self.cafeArticleListView.delegate = self
    
    self.setSearchBarButton()
    self.setRefreshControl()
  }
  
  
  // MARK: Button Action
  
  private func setSearchBarButton() {
    self.searchBar.searchButton.addTarget(self, action: #selector(self.searchCafeArticle), for: .touchUpInside)
  }
  
  @objc private func searchCafeArticle(sender: UIButton) {
    self.searchKeyword = self.searchBar.text ?? ""
    self.loadList()
  }
  
  
  // MARK: Refresh Action
  
  private func setRefreshControl() {
    self.cafeArticleListView.refreshControl = UIRefreshControl()
    cafeArticleListView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
  }
  
  @objc private func onRefresh() {
    self.loadList()
  }
  
  private func loadList() {
    if self.searchKeyword == "" { return }
    
    viewModel?.loadingStarted = { [weak activity] in
      activity?.isHidden = false
      activity?.startAnimating()
    }
    
    viewModel?.loadingEnded = { [weak activity] in
      activity?.stopAnimating()
    }
    
    viewModel?.cafeArticleListUpdated = { [weak self] in
      self?.cafeArticleListView.reloadData()
      self?.cafeArticleListView.refreshControl?.endRefreshing()
    }
    
    viewModel?.list(with: self.searchKeyword)
  }
}


// MARK: - UITableView DataSource

extension CafeSearchListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModel?.countCafeArticleList() ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.cafeArticleListView.dequeueReusableCell(withIdentifier: "CafeListCell", for: indexPath) as! CafeListCell
    cell.setData(with: self.viewModel?.cafeArticle(at: indexPath.row))
    return cell
  }
}


// MARK: UITableView Delegate

extension CafeSearchListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailViewController = CafeArticleDetailViewController()
    detailViewController.article = viewModel?.cafeArticle(at: indexPath.row)
    self.navigationController?.pushViewController(detailViewController, animated: true)
  }
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
