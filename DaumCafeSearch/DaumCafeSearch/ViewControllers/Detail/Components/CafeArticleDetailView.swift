//
//  CafeArticleDetailView.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import UIKit

import SnapKit

final class CafeArticleDetailView: UIView {
  
  // MARK: Properties
  
  let thumbnailImageView = UIImageView()
  let cafeNameLabel = UILabel()
  let titleLabel = UILabel()
  let dateTimeLabel = UILabel()
  let contentLabel = UILabel()
  let urlButton = UIButton()
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.backgroundColor = .white
    
    [
      self.titleLabel,
      self.contentLabel,
      self.cafeNameLabel,
      self.dateTimeLabel,
      self.thumbnailImageView,
      self.urlButton
    ].forEach {
      self.addSubview($0)
    }
    
    self.setThumbnailImageView()
    self.setCafeNameLabel()
    self.setTitleLabel()
    self.setDateTimeLabel()
    self.setContentLabel()
    self.setURLButton()
  }
  
  private func setThumbnailImageView() {
    self.thumbnailImageView.do {
      $0.contentMode = .scaleAspectFit
    }
    
    self.thumbnailImageView.snp.makeConstraints {
      $0.top.equalToSuperview().inset(100)
      $0.width.height.equalTo(200)
      $0.leading.trailing.equalToSuperview().inset(10)
    }
  }
  
  private func setCafeNameLabel() {
    self.cafeNameLabel.do {
      $0.font = .systemFont(ofSize: 30, weight: .bold)
      $0.textColor = .daumCafeColor
      $0.numberOfLines = 0
    }
    
    self.cafeNameLabel.snp.makeConstraints {
      $0.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
      $0.leading.trailing.equalTo(thumbnailImageView)
    }
    
    self.cafeNameLabel.lineBreakMode = .byCharWrapping
  }
  
  private func setTitleLabel() {
    self.titleLabel.do {
      $0.font = .systemFont(ofSize: 45, weight: .bold)
      $0.numberOfLines = 0
    }
    
    self.titleLabel.snp.makeConstraints {
      $0.top.equalTo(cafeNameLabel.snp.bottom).offset(10)
      $0.leading.trailing.equalTo(thumbnailImageView)
    }
    
    self.titleLabel.lineBreakMode = .byCharWrapping
  }
  
  private func setDateTimeLabel() {
    self.dateTimeLabel.do {
      $0.font = .systemFont(ofSize: 12, weight: .light)
      $0.alpha = 0.5
    }
    
    self.dateTimeLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.leading.trailing.equalTo(thumbnailImageView)
    }
  }
  
  private func setContentLabel() {
    self.contentLabel.do {
      $0.font = .systemFont(ofSize: 20)
      $0.numberOfLines = 0
    }
    
    self.contentLabel.snp.makeConstraints {
      $0.top.equalTo(dateTimeLabel.snp.bottom).offset(10)
      $0.leading.trailing.equalTo(thumbnailImageView)
    }
  }
  
  private func setURLButton() {
    self.urlButton.do {
      $0.setTitle("홈페이지로 이동", for: .normal)
      $0.setTitleColor(.daumCafeColor, for: .normal)
    }
    
    self.urlButton.snp.makeConstraints {
      $0.leading.trailing.equalTo(thumbnailImageView)
      $0.top.equalTo(self.contentLabel.snp.bottom).offset(20)
    }
  }
  
  func setData(with data: CafeArticle?) {
    guard let data = data else { return }
    self.thumbnailImageView.kf.setImage(with: data.thumbnailURL, placeholder: UIImage(systemName: "photo"))
    self.titleLabel.text = data.title
    self.contentLabel.text = data.content
    self.cafeNameLabel.text = data.cafeName
    
    var datetime: String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy년 MM월 dd일"
      let contentDate = data.datetime ?? Date()
      
      return dateFormatter.string(from: contentDate)
    }
    
    self.dateTimeLabel.text = datetime
  }
}
