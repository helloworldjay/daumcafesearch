//
//  NetworkManager.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import Foundation

import Alamofire

protocol NetworkManagerLogic {
  func fetchDaumCafeList(with keyword: String, completion: @escaping (DaumCafeSearchResponse) -> Void)
}

struct NetworkManager: NetworkManagerLogic {
  
  var session: Session
  
  init(session: Session = AF) {
    self.session = session
  }
  
  func fetchDaumCafeList(with keyword: String, completion: @escaping (DaumCafeSearchResponse) -> Void) {
    
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter().then {
      $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
    }
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    
    session.request(NetworkRequestRouter.fetchDaumCafeArticle(keyword))
      .validate()
      .responseDecodable(of: DaumCafeSearchResponse.self, decoder: decoder) { response in
        switch response.result {
        case .success(let value):
          completion(value)
        case .failure(let error):
          print(error)
        }
      }
  }
}
