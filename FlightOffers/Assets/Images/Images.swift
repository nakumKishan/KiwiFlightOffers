//
//  Images.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // Image Information
 /*
  *Note:-
  - All Images used throughout the App for Dark/Light Model
  */
 ------------------------------------------------*/

import Foundation
import SwiftUI

/*--------------------------------------------
 MARK: Images - All Images
 --------------------------------------------*/
extension Image{
  static let  local = AppImage()
  static let  system = SystemImage()
}

/*--------------------------------------------
 MARK: Images - Placeholder Images
 --------------------------------------------*/
struct AppImage{
  let placeholder = UIImage(named:"placeholderImage")
  let ticket = Image("ticket")
}

/*--------------------------------------------
 MARK: Images - Sytem Provided Images
 --------------------------------------------*/
struct SystemImage{
  let  airplane = Image(systemName: "airplane")
  let airplaneDeparture = Image(systemName: "airplane.departure")
  let airplaneCircleFill = Image(systemName: "airplane.circle.fill")
  let arrowClockwiseCircle = Image(systemName: "arrow.clockwise.circle.fill")
  let chevronDownFill = Image(systemName: "chevron.down.circle.fill")
  let clock = Image(systemName: "clock")
  let clockFill = Image(systemName: "clock.fill")
  let calendarCircleFill = Image(systemName: "calendar.circle.fill")
  let goforward = Image(systemName: "goforward")

}
