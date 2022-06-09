//
//  FlightDataProvider.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // FlightDataProvider Information
 /*
  *Note:-
  Usage :- Responsible for API Calls and Data validation for Unique Destinations
  */
 ------------------------------------------------*/

import Foundation
import Combine
import SwiftUI

class FlightDataProvider {
  /*--------------------------------------------
   MARK: Variables & initializers
  --------------------------------------------*/
  @Published var allFlights: [Flight] = []
  @Published var error: (isError:Bool,errorMessage:String?) = (false,nil)

  var flightSubscription: AnyCancellable?
  private let store : FlightDataStore = FlightDataStore()

  var presentDay : Int? {
    return Calendar.current.dateComponents([.weekday], from: Date()).weekday
  }

  var isNextDay : Bool {
    guard let savedDate = store.get(dataKey: .presentDay, type: Int.self) else{
      store.save(data: [.presentDay(presentDay)])
      return false
    }
    return savedDate == presentDay ? false : true
  }

  init() {
  }

  /*--------------------------------------------
   MARK: API CALL
  --------------------------------------------*/
  func getFlightsData() {
    do {
      let today = DateManager.shared.getCurrentDate()
      let queryP = FlightRequest(dateFrom:today,dateTo:today)
      let request = try URLRequest(urlString:AppUrl.flights, method: .get, query:queryP.asDictionary())
      flightSubscription = NetworkingManager.download(urlRequest:request)
        .decode(type: FlightResponse.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { (completion) in
          if let error =  NetworkingManager.handleCompletion(completion: completion) {self.error = (true,error)}
        },
              receiveValue: { [weak self] (flightData) in
          guard let fData = flightData.data,!fData.isEmpty else{
            self?.error = (true,NetworkingError.ServerError.errorDescription)
            return
          }
          self?.getUniqueDestinations(apiFlights: fData)
          self?.flightSubscription?.cancel()
        })
    }catch NetworkingError.invalidURLRequest(endpoint: AppUrl.flights){ print(NetworkingError.invalidURLRequest(endpoint: AppUrl.flights))
    }catch { print(error.localizedDescription)}
  }

  /*--------------------------------------------
   MARK: Function - Get Unique Destination each day
   Note :
   -  [A] : If New Day or No History -> Get New Unique Data & Store Reference
   -  [B] : If Same Day -> Get Data from History,Current Flight and sync with API Data
   -  [B] : For Same Day if less than 5 trips available then add n number trips accordingly
   - Store Value Information : 5 Current Flights(City Name Only),History(City Name Only),Current Day
  --------------------------------------------*/
  func getUniqueDestinations(apiFlights:[Flight]){
    refereshData()
    let savedDestinations = store.get(dataKey: .history, type: [String].self) ?? []
    let uniqueDestinations = apiFlights.filter{ !savedDestinations.contains($0.cityTo ?? "")}
    if (isNextDay || savedDestinations.isEmpty) && uniqueDestinations.count > 0 {
      let destinaionToShow =  uniqueDestinations[...min(4, uniqueDestinations.count)]
      let updatedStoredDestinations =  savedDestinations +  destinaionToShow.compactMap{$0.cityTo}
      self.allFlights = destinaionToShow.sorted(by: { $0.cityTo! < $1.cityTo! })
      store.save(data: [.history(updatedStoredDestinations),
                        .currentDestinations(destinaionToShow.compactMap{$0.cityTo}),
                        .presentDay(presentDay)
                       ])
    }else{
      let currentDestinations = store.get(dataKey: .currentDestinations, type: [String].self) ?? []
      var filteredDestinations = apiFlights.filter{ currentDestinations.contains($0.cityTo ?? "")}
      if filteredDestinations.count < 5 {
        let diff = 5 - filteredDestinations.count
        let newDestinations =  uniqueDestinations[0...(diff - 1)]
        filteredDestinations += newDestinations
        store.save(data: [.history(savedDestinations + newDestinations.compactMap{$0.cityTo}),
                          .currentDestinations(filteredDestinations.compactMap{$0.cityTo}),
                         ])
      }
      self.allFlights = filteredDestinations.sorted(by: { $0.cityTo! < $1.cityTo! })
    }
  }

  /*--------------------------------------------
   MARK: Function - Remove Flight reference from store
   Note :
   - After 40 trips (8 Days) referesh the offers
  --------------------------------------------*/
  func refereshData(){
    let currentFlights = store.get(dataKey: .currentDestinations, type: [String].self) ?? []
    let history = store.get(dataKey: .history, type: [String].self) ?? []
    if history.count > currentFlights.count * 8{
      store.remove(dataKey: .history)
    }

  }
}



