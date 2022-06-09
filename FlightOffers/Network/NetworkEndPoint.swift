//
//  NetworkEndPoint.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 09/06/22.
//
/*------------------------------------------------
 // AppUrl Information
 /*
  *Note:-
  Usage :- Responsible for all API Endpoints used inside APP
  */
 ------------------------------------------------*/

import Foundation

struct AppUrl {

  private static let baseUrl = "https://api.skypicker.com"
  private static let imageBaseUrl = "https://images.kiwi.com"

  /*--------------------------------------------
   MARK: Endpoint : Flights
  --------------------------------------------*/
  static var flights: String {
      return baseUrl  + "/flights"
  }

  /*--------------------------------------------
   MARK: Endpoint : Destination Image
  --------------------------------------------*/
  static var destinationPhoto: String {
      return imageBaseUrl  + "/photos/600x330/"
  }

  /*--------------------------------------------
   MARK: Endpoint : Airlines Image
  --------------------------------------------*/
  static var airlinePhoto: String {
      return imageBaseUrl  + "/airlines/64/"
  }

}
