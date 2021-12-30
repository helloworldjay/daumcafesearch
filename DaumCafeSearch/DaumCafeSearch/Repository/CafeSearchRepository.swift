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
  private func parseCafeList(of response: DaumCafeSearchResponse) -> [CafeArticle] {
    return response.cafeArticles.map {
      CafeArticle(
        cafeName: $0.cafeName,
        content: String(htmlEncodedString: $0.content) ?? $0.content,
        datetime: $0.dateTime,
        thumbnailURL: URL(string: $0.thumbnail),
        title: String(htmlEncodedString: $0.title) ?? $0.title,
        url: URL(string: $0.url)
      )
    }
  }


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
