//
//  NetworkRequestRouter.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import Foundation

import Alamofire

enum NetworkRequestRouter: URLRequestConvertible {
  
  case fetchDaumCafeArticle(String)
  
  private var baseURLString: String {
    return "https://dapi.kakao.com"
  }
  
  private var HTTPMethod: Alamofire.HTTPMethod {
    switch self {
    case .fetchDaumCafeArticle(_):
      return .get
    }
  }
  
  private var headers: HTTPHeaders {
    switch self {
    case .fetchDaumCafeArticle(_):
      return ["Authorization" : "KakaoAK e45ac62d954b519379dfdd3001eb7241"]
    }
  }
  
  private var path: String {
    switch self {
    case .fetchDaumCafeArticle(_):
      return "\(self.baseURLString)" + "/v2/search/cafe"
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let url = try self.path.asURL()
    var request = URLRequest(url: url)
    request.httpMethod = self.HTTPMethod.rawValue
    request.headers = self.headers
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    switch self {
    case .fetchDaumCafeArticle(let keyword):
      do {
        var params = [String:Any]()
        params["query"] = keyword
        let encoding = URLEncoding(destination: URLEncoding.Destination.queryString)
        return try encoding.encode(request, with: params)
      } catch {
        return request
      }
    }
  }
}
