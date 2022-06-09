//
//  FlightsViewModel.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // FlightsViewModel Information
 /*
  *Note:-
  Usage :- Used to handle Data Coming from server as well as API States
  Parent Screen:- Environmental Object
  */
 ------------------------------------------------*/

import Foundation
import Combine

class FlightsViewModel: ObservableObject {
  /*--------------------------------------------
   MARK: Variables & initializers
   --------------------------------------------*/
  enum State {
    case idle
    case loading
    case failed(error:String)
    case loaded
  }
  
  @Published var state = State.idle
  @Published var allFlights: [Flight] = []
  @Published var isLoading: Bool = false
  
  private let flightDataProvider : FlightDataProvider!
  private var cancellables = Set<AnyCancellable>()
  
  init(provider:FlightDataProvider) {
    self.flightDataProvider = provider
    addSubscribers()
  }
  
  /*--------------------------------------------
   MARK: Subscribers
   --------------------------------------------*/
  func addSubscribers() {
    flightDataProvider.$allFlights
      .dropFirst()
      .sink { [weak self] (responseData) in
        self?.allFlights = responseData
        self?.state = .loaded
        self?.isLoading = false
      }
      .store(in: &cancellables)
    flightDataProvider.$error
      .dropFirst()
      .sink { [weak self] (responseError) in
        self?.isLoading = false
        if let message = responseError.errorMessage{
          self?.state = .failed(error: message)
        }
      }
      .store(in: &cancellables)
  }
  
  /*--------------------------------------------
   MARK: Fetch API Data
   --------------------------------------------*/
  func reloadData() {
    isLoading = true
    self.state = .loading
    flightDataProvider.getFlightsData()
  }
}
