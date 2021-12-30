//
//  CafeListCell.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import UIKit

import Kingfisher
import SnapKit

final class CafeListCell: UITableViewCell {
  
  // MARK: Properties
  
  let titleLabel = UILabel()
  let contentLabel = UILabel()
  let cafeNameLabel = UILabel()
  let dateTimeLabel = UILabel()
  let thumbnailImageView = UIImageView()
  
  
  // MARK: Layout
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    [self.titleLabel, self.contentLabel, self.cafeNameLabel, self.dateTimeLabel, self.thumbnailImageView].forEach {
      contentView.addSubview($0)
    }
    
    self.setTitleLabel()
    self.setContentLabel()
    self.setCafeNameLabel()
    self.setDateTimeLabel()
    self.setThumbnailImageView()
  }
  
  private func setTitleLabel() {
    self.titleLabel.do {
      $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    self.titleLabel.snp.makeConstraints {
      $0.top.leading.equalToSuperview().inset(8)
      $0.trailing.lessThanOrEqualTo(thumbnailImageView.snp.leading).offset(-8)
    }
  }
  
  private func setContentLabel() {
    self.contentLabel.do {
      $0.font = .systemFont(ofSize: 14)
      $0.numberOfLines = 2
    }
    
    self.contentLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(titleLabel)
      $0.trailing.equalTo(thumbnailImageView.snp.leading).offset(-8)
    }
  }
  
  private func setCafeNameLabel() {
    self.cafeNameLabel.do {
      $0.font = .systemFont(ofSize: 12, weight: .light)
      $0.textColor = .daumCafeColor
    }
    
    self.cafeNameLabel.snp.makeConstraints {
      $0.top.equalTo(contentLabel.snp.bottom).offset(8)
      $0.leading.equalTo(titleLabel)
      $0.bottom.equalTo(thumbnailImageView)
    }
  }
  
  private func setDateTimeLabel() {
    self.dateTimeLabel.do {
      $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    self.dateTimeLabel.snp.makeConstraints {
      $0.top.equalTo(contentLabel.snp.bottom).offset(8)
      $0.trailing.equalTo(contentLabel)
      $0.bottom.equalTo(thumbnailImageView)
    }
  }
  
  private func setThumbnailImageView() {
    self.thumbnailImageView.do {
      $0.contentMode = .scaleAspectFit
    }
    
    self.thumbnailImageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.top.trailing.bottom.equalToSuperview().inset(8)
      $0.width.height.equalTo(80)
    }
  }
}
