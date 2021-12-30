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
}


// MARK: - Array

extension Array {
  subscript(safe index: Int) -> Element? {
    return self.indices ~= index ? self[index] : nil
  }
}
