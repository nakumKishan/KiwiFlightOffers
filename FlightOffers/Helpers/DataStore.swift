//
//  DataStore.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 07/06/22.
//
/*------------------------------------------------
 // FlightDataStore Information
 /*
  *Note:-
  - FlightDataStore used to store/remove/retrive Flight information to userdefaults
  */
 ------------------------------------------------*/

import Foundation

class FlightDataStore{
  /*--------------------------------------------
   MARK: Storage-Save
   --------------------------------------------*/
  func save(data:[StoreData]){
    for storeData in data{
      switch storeData {
      case .history(let hData):
        UserDefaults.standard.set(hData, forKey: StoreKey.history.rawValue)
      case .currentDestinations(let cdData):
        UserDefaults.standard.set(cdData, forKey: StoreKey.currentDestinations.rawValue)
      case .presentDay(let presentDay):
        if let pData = presentDay {UserDefaults.standard.set(pData, forKey: StoreKey.presentDay.rawValue)}
      }
    }
  }

  /*--------------------------------------------
   MARK: Storage-Retrive
   --------------------------------------------*/
  func get<T>(dataKey:StoreKey, type: T.Type)->T?{
    let data = UserDefaults.standard.value(forKey: dataKey.rawValue) as? T
    return data
  }

  /*--------------------------------------------
   MARK: Storage-Remvoe
   --------------------------------------------*/
  func remove(dataKey:StoreKey){
    UserDefaults.standard.removeObject(forKey: dataKey.rawValue)
  }
}
