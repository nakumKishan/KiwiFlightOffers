//
//  FlightRequest.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // FlightRequest Information
 /*
  *Note:-
  Usage :- API Request Model
  */
 ------------------------------------------------*/

import Foundation

struct FlightRequest : Encodable{
  let v : String?
  let sort : String?
  let asc : String?
  let locale : String?
  let children : String?
  let infants : String?
  let flyFrom : String?
  let to : String?
  let featureName : String?
  let dateFrom : String?
  let dateTo : String?
  let typeFlight : String?
  let oneforcity : String?
  let one_per_date : String?
  let wait_for_refresh : String?
  let partner : String?
  let adults : String?
  let limit : String?

  init(v:String? = Constants.apiData.v,sort:String? = Constants.apiData.sort,asc:String?=Constants.apiData.asc,locale:String?=Constants.apiData.locale,children:String?=Constants.apiData.children,infants:String?=Constants.apiData.infants,flyFrom:String?=Constants.apiData.flyFrom,to:String?=Constants.apiData.to,featureName:String?=Constants.apiData.featureName,dateFrom:String?=Constants.apiData.dateFrom,dateTo:String?=Constants.apiData.dateTo,typeFlight:String?=Constants.apiData.typeFlight,oneforcity:String?=Constants.apiData.oneforcity,one_per_date:String?=Constants.apiData.one_per_date,wait_for_refresh:String?=Constants.apiData.wait_for_refresh,partner:String?=Constants.apiData.partner,adults:String?=Constants.apiData.adults,limit:String?=Constants.apiData.limit){
    self.v = v
    self.sort = sort
    self.asc = asc
    self.locale = locale
    self.children = children
    self.infants = infants
    self.flyFrom = flyFrom
    self.featureName = featureName
    self.dateFrom = dateFrom
    self.dateTo = dateTo
    self.typeFlight = typeFlight
    self.oneforcity = oneforcity
    self.one_per_date = one_per_date
    self.wait_for_refresh = wait_for_refresh
    self.partner = partner
    self.adults = adults
    self.to = to
    self.limit = limit
  }
}
