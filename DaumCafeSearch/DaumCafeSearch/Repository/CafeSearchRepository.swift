//
//  CafeSearchRepository.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import Foundation

protocol CafeSearchRepositoryLogic {
}


// MARK: - Repository

final class CafeSearchRepository: CafeSearchRepositoryLogic {


// MARK: - Edit HTML String

extension String {
  init?(htmlEncodedString: String) {
    guard let data = htmlEncodedString.data(using: .utf8) else {
      return nil
    }
    let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
      .documentType: NSAttributedString.DocumentType.html,
      .characterEncoding: String.Encoding.utf8.rawValue
    ]
    guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
      return nil
    }
    self.init(attributedString.string)
  }
}
