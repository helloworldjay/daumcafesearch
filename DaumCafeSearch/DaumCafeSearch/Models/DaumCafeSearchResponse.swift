//
//  DaumCafeSearchResponse.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import Foundation

/**
 {
 "meta": {
 "is_end": false,
 "pageable_count": 983,
 "total_count": 218662
 },
 "documents": [
 {
 "cafename": "쭉빵카페",
 "contents": "무대의상들 정보 궁금해하는 게녀들이 있길래 가져왔어! 이번에는 레드벨벳이랑 <b>아이유</b> 의상만 가져왔는데 기회가 되면 다음에 다른 연예인들 의상도 가져올게~ 링크가...",
 "datetime": "2017-01-31T16:57:33.000+09:00",
 "thumbnail": "https://search1.kakaocdn.net/thumb/P100x100/?fname=http%3A%2F%2Fsearch1.kakaocdn.net%2Fargon%2F130x130_85_c%2FFJtvuJLusO",
 "title": "연예인 무대의상 정보 가져왔어! (feat. 레드벨벳, <b>아이유</b>)",
 "url": "http://cafe.daum.net/ok1221/9fQk/39709"
 },
 ...
 ]
 }
 */

struct DaumCafeSearchResponse: Decodable {
  let metaData: DaumCafeSearchMetaData
  let cafeArticles: [DaumCafeArticle]
  
  enum CodingKeys: String, CodingKey {
    case metaData = "meta"
    case cafeArticles = "documents"
  }
}

struct DaumCafeSearchMetaData: Decodable {
  let totalCount: Int
  let pageableCount: Int
  let isEnd: Bool
  
  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case pageableCount = "pageable_count"
    case isEnd = "is_end"
  }
}

struct DaumCafeArticle: Decodable {
  let cafeName: String
  let content: String
  let dateTime: Date
  let thumbnail: String
  let title: String
  let url: String
  
  enum CodingKeys: String, CodingKey {
    case cafeName = "cafename"
    case content = "contents"
    case dateTime = "datetime"
    case thumbnail
    case title
    case url
  }
}
