//
//  Route.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // Route Information
 /*
  *Note:-
  Usage :- API Model
  Model Hierarchy:- FlightResponse -> Flight -> Route
  */
 ------------------------------------------------*/

import Foundation

/*--------------------------------------------
 MARK: Route
 --------------------------------------------*/
struct Route: Codable,Identifiable {
  let id, flyFrom, flyTo: String?
  let cityFrom, cityCodeFrom, cityTo, cityCodeTo: String?
  let dTime, dTimeUTC, aTime, aTimeUTC: Int?
  let airline: String?
  let flightNo: Int?
  let price: Int?
  var airlineImageURL: URL{
    URL(string: AppUrl.airlinePhoto + "\(airline ?? Constants.emptyText).png")!
  }

  enum CodingKeys: String, CodingKey {
    case id
    case flyFrom, flyTo, cityFrom, cityCodeFrom, cityTo, cityCodeTo, dTime, dTimeUTC, aTime, aTimeUTC, airline
    case flightNo = "flight_no"
    case price
  }
}

/*--------------------------------------------
 MARK: Country
 --------------------------------------------*/
struct Country: Codable {
  let code, name: String?
}
