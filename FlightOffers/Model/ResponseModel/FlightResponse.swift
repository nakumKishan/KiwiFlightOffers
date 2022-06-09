//
//  FlightResponse.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // FlightResponse Information
 /*
  *Note:-
  Usage :- API Model
  Model Hierarchy:- FlightResponse -> Flight -> Route
  */
 ------------------------------------------------*/

import Foundation

struct FlightResponse: Codable,Identifiable {
  let id = UUID().uuidString
  let searchID: String?
  let currency: String?
  let data: [Flight]?

  enum CodingKeys: String, CodingKey {
    case searchID = "search_id"
    case currency
    case data
  }
}
