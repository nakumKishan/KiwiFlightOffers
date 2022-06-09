//
//  NetworkManager.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // NetworkingManager Information
 /*
  *Note:-
  Usage :- Responsible for handling URLSession and API Errors
  */
 ------------------------------------------------*/

import Foundation
import Combine
/*--------------------------------------------
 MARK: Network Errors
--------------------------------------------*/
enum NetworkingError: LocalizedError {
  case badURLResponse(url: URL)
  case invalidURLRequest(endpoint:String)
  case jSONSerialization
  case ServerError
  case unknown

  var errorDescription: String? {
    switch self {
    case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
    case .invalidURLRequest(endpoint: let endpoint): return "[🔥] Bad request for endpoint: \(endpoint)"
    case .ServerError: return "[⚠️ ServerError] Empty Flight data coming from the Server.Please retry."
    case .jSONSerialization: return "[⚠️] JSONSerialization error occured"
    case .unknown: return "[⚠️] Unknown error occured"
    }
  }
}

/*--------------------------------------------
 MARK: NetworkingManager : URLSession Methods
--------------------------------------------*/
class NetworkingManager {

  static func download(urlRequest: URLRequest) -> AnyPublisher<Data, Error> {
    return URLSession.shared.dataTaskPublisher(for: urlRequest)
      .tryMap({ try handleURLResponse(output: $0, url:urlRequest.url!) })
      .retry(3)
      .eraseToAnyPublisher()
  }

  static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
    guard let response = output.response as? HTTPURLResponse,
          response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
          }
    return output.data
  }

  static func handleCompletion(completion: Subscribers.Completion<Error>)->String?{
    switch completion {
    case .finished:
      return nil
    case .failure(let error):
      return error.localizedDescription
    }
  }
}

