//
//  Enums.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
// Enums Information
 /*
    *Enums:-
     DateFormats : All Dateformats use in the app
     StoreKey : Keys use to store destinations and date related Data
     StoreData : Data enum related to Store
 */
------------------------------------------------*/

import Foundation

/*--------------------------------------------
 MARK: Enum-Dateformat
 --------------------------------------------*/
enum DateFormats: String{
    case fullDate = "dd MMMM"
    case dateOnly = "dd MMM"
    case timeOnly = "HH:mm"
    case dateWithYear = "dd/MM/yyyy"
}

/*--------------------------------------------
 MARK: Enum-Storage
 --------------------------------------------*/
enum StoreKey:String{
  case history = "history"
  case currentDestinations = "currentDestinations"
  case presentDay = "presentDay"
}
 enum StoreData{
   case history([String])
   case currentDestinations([String])
   case presentDay(Int?)
 }

/*--------------------------------------------
 MARK: Enum- Http Methods
 --------------------------------------------*/
enum HttpMethod:String{
 case get
 case post
 case put
 case delete

 var name: String {
   return rawValue.uppercased()
 }
}
