//
//  CafeSearchViewModel.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import Foundation

protocol CafeSearchViewModelLogic {
  var repository: CafeSearchRepositoryLogic? { get set }
  var loadingStarted: () -> Void { get set }
  var loadingEnded: () -> Void { get set }
  var cafeArticleListUpdated: () -> Void { get set }
  
  func list(with keyword: String)
  func cafeArticle(at index: Int) -> CafeArticle?
  func countCafeArticleList() -> Int
}

final class CafeSearchViewModel: CafeSearchViewModelLogic {
  
  // MARK: Properties
  
  var repository: CafeSearchRepositoryLogic?
  var loadingStarted: () -> Void = { }
  var loadingEnded: () -> Void = { }
  var cafeArticleListUpdated: () -> Void = { }
  
  private var cafeArticleList: [CafeArticle] = []
  private var isLoading = false
  
  
  // MARK: Cafe Articles
  
  func cafeArticle(at index: Int) -> CafeArticle? {
    return self.cafeArticleList[safe: index]
  }
  
  func countCafeArticleList() -> Int {
    return self.cafeArticleList.count
  }
  
  
  // MARK: Fetch List Logic
  
  func list(with keyword: String) {
    self.isLoading = true
    self.loadingStarted()
    self.repository?.list(with: keyword) { [weak self] in
      self?.cafeArticleList = $0
      self?.cafeArticleListUpdated()
      self?.loadingEnded()
      self?.isLoading = false
    }
  }
}


// MARK: - Array

extension Array {
  subscript(safe index: Int) -> Element? {
    return self.indices ~= index ? self[index] : nil
  }
}
