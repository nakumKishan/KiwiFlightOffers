//
//  Flight.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // Flight Information
 /*
  *Note:-
  Usage :- API Model
  Model Hierarchy:- FlightResponse -> Flight -> Route
  */
 ------------------------------------------------*/

import Foundation

struct Flight: Codable,Identifiable {
  let id, flyFrom, flyTo, cityFrom: String?
  let cityCodeFrom, cityTo, cityCodeTo: String?
  let countryFrom, countryTo: Country?
  let dTime, dTimeUTC, aTime, aTimeUTC: Int?
  let flyDuration: String?
  let price: Int?
  let route: [Route]?
  let bookingToken: String?
  let deepLink: String?
  let mapIdfrom, mapIdto: String?
  var destinationImageURL: URL{
    return URL(string: AppUrl.destinationPhoto + "\(mapIdto ?? "photos").jpg")!
  }
  var finalPrice: String{
    return "\(price ?? 0)" + " €"
  }

  enum CodingKeys: String, CodingKey {
    case id, flyFrom, flyTo, cityFrom, cityCodeFrom, cityTo, cityCodeTo, countryFrom, countryTo, dTime, dTimeUTC, aTime, aTimeUTC
    case flyDuration = "fly_duration"
    case price
    case  route
    case bookingToken = "booking_token"
    case deepLink = "deep_link"
    case mapIdfrom, mapIdto
  }
}
