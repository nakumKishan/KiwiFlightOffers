//
//  Constants.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//

/*------------------------------------------------
// Constants Information
 /*
    *Constants:-
     Constants : All Constants
     Placeholders : View Placeholder texts used in all screens
     StaticAPIData : API Request static Parameters
 */
------------------------------------------------*/

import UIKit

/*--------------------------------------------
 MARK: Constants-All
 --------------------------------------------*/
struct Constants{
  static let screenWidth = UIScreen.main.bounds.width
  static let screenHeight = UIScreen.main.bounds.height
  static let emptyText = ""
  static let apiData = StaticAPIData()
  static let placeholders = Placeholders()
}

/*--------------------------------------------
 MARK: Constants-Placeholders
 --------------------------------------------*/
struct Placeholders{
  let date = "Date"
  let price = "Price"
  let duration = "Duration"
  let loadingText = "Fetching Offers..."
  let navTitle = "Flight Offers"
}

/*--------------------------------------------
 MARK: Constants-Static API Data
 --------------------------------------------*/
struct StaticAPIData{
  let v = "3"
  let sort = "popularity"
  let asc = "1"
  let locale = "en"
  let children = "0"
  let infants = "0"
  let flyFrom = "49.2-16.61-250km"
  let to = "anywhere"
  let featureName = "aggregateResults"
  let dateFrom = "06/07/2022"
  let dateTo = "06/07/2022"
  let typeFlight = "oneway"
  let oneforcity = "1"
  let one_per_date = "0"
  let wait_for_refresh = "0"
  let partner = "skypicker"
  let adults = "1"
  let limit = "200"
}

