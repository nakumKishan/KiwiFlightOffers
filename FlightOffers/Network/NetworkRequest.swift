//
//  NetworkRequest.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//

import Foundation

extension URLRequest{

  /*--------------------------------------------
   MARK: URLRequest initializer
   --------------------------------------------*/

  init(urlString:String, method: HttpMethod, headers:StringParameters? = nil,query:StringParameters? = nil, body:JsonDic? = nil) throws{
    guard var urlComponents = URLComponents(string: urlString) else {throw NetworkingError.invalidURLRequest(endpoint: urlString)}
    if let queryP = query { urlComponents.setQueryItems(with: queryP)}
    guard let validURL = urlComponents.url else{throw NetworkingError.invalidURLRequest(endpoint: urlString)}
    self.init(url:validURL)
    self.httpMethod = method.name
    if let bodyP = body {try setBody(body:bodyP)}
    if let headerP = headers {setHeaders(headerFields: headerP)}
  }

  /*--------------------------------------------
   MARK: Custom Helper Methods
   --------------------------------------------*/

  private mutating func setBody(body: [String: Any])throws{
    guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else { throw NetworkingError.jSONSerialization }
    self.httpBody = httpBody
  }

  private mutating func setHeaders(headerFields: [String: String]){
    for (key, value) in headerFields {
      self.setValue("\(value)", forHTTPHeaderField: "\(key)")
    }
  }
}

typealias StringParameters = [String:String]
typealias JsonDic = [String:Any]
