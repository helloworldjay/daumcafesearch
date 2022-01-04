//
//  SearchBar.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import UIKit

import SnapKit
import Then

final class SearchBar: UISearchBar {
  
  // MARK: Properties
  
  let searchButton = UIButton().then {
    $0.setTitle("검색", for: .normal)
    $0.setTitleColor(.daumCafeColor, for: .normal)
  }
  
  
  // MARK: Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.layout()
    self.configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layout() {
    self.addSubview(searchButton)
    
    self.searchTextField.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(12)
      $0.trailing.equalTo(searchButton.snp.leading).offset(-12)
      $0.centerY.equalToSuperview()
    }
    
    self.searchButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(12)
    }
  }
  
  private func configure() {
    self.placeholder = "검색어를 입력하세요."
    self.setImage(
      UIImage(named: "icSearchNonW"),
      for: UISearchBar.Icon.search,
      state: .normal
    )
    self.setSearchTextField()
  }
  
  private func setSearchTextField() {
    self.searchTextField.textColor = .white
    self.searchTextField.backgroundColor = .black
    self.searchTextField.leftView?.tintColor = .white
  }
}

