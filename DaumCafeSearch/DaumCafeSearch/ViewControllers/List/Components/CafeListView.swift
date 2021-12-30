//
//  CafeListView.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import UIKit

final class CafeListView: UITableView {
  
  // MARK: Initializers
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    
    self.attribute()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func attribute() {
    self.backgroundColor = .white
    self.register(CafeListCell.self, forCellReuseIdentifier: "CafeListCell")
    self.separatorStyle = .singleLine
    self.rowHeight = 100
  }
}
