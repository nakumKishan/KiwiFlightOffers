//
//  DateManager.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 07/06/22.
//
/*------------------------------------------------
 // DateManager Information
 /*
  *Note:-
  - Datemanger is helper class to handle all Date/Time conversations
  */
 ------------------------------------------------*/

import Foundation
import Metal

class DateManager {

  /*--------------------------------------------
   MARK: Variables & initializers
  --------------------------------------------*/
    static let shared = DateManager()
    var calendar: Calendar
    init() {
        calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local
    }

  /*--------------------------------------------
   MARK: DATE - Get Date String in Specific Format
  ----------------------------------------------*/
  func getDate(format:DateFormats,timeStamp:Int?) -> String{
    guard let interval = timeStamp else{return Constants.emptyText}
      let timeinterval = TimeInterval(interval)
     let date = Date(timeIntervalSince1970: timeinterval)
      let formatter = DateFormatter()
          formatter.calendar = Calendar.current
          formatter.dateFormat = format.rawValue
        return formatter.string(from: date)
  }

  /*--------------------------------------------
   MARK: DATE - Difference between two Dates
  ----------------------------------------------*/
  func differenceBetweenDates(aTime:Int,dTime:Int)->String{
    let dTimeinterval = TimeInterval(dTime)
    let dDate = Date(timeIntervalSince1970: dTimeinterval)
    let aTimeinterval = TimeInterval(aTime)
    let aDate = Date(timeIntervalSince1970: aTimeinterval)
    let diffComponents = Calendar.current.dateComponents([.hour, .minute], from: dDate, to: aDate)
    let hours = diffComponents.hour
    let minutes = diffComponents.minute
    return ("\(hours ?? 0)h \(minutes ?? 0)m")
  }
  /*--------------------------------------------
   MARK: DATE - Current Date string
  ----------------------------------------------*/
  func getCurrentDate()->String{
    let format = DateFormatter()
        format.dateFormat = DateFormats.dateWithYear.rawValue
    return format.string(from: Date())
  }
}


