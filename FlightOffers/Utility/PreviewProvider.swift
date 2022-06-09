//
//  PreviewProvider.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 08/06/22.
//
/*------------------------------------------------
 // Preview Provider Information
 /*
  *Note:-
  - Preview provider is used to pass static dummy data to all SwiftUI Previews.
  */
 ------------------------------------------------*/

import Foundation
import SwiftUI

extension PreviewProvider {

  static var dev: DeveloperPreview {
    return DeveloperPreview.instance
  }
}

class DeveloperPreview {

  static let instance = DeveloperPreview()
  private init() { }
  var vm : FlightsViewModel {
    let vm = FlightsViewModel(provider: FlightDataProvider())
    vm.state = .loaded
    vm.allFlights = [flight]
    return vm
  }
  let flight = Flight(
    id:"19ef13a24aed00000327d0d20|13a20a224aed0000a93843630",
    flyFrom: "VIE",
    flyTo: "MAD",
    cityFrom: "Vienna",
    cityCodeFrom: "VIE",
    cityTo: "Madrid",
    cityCodeTo: "MAD",
    countryFrom: Country(code: "AT", name: "Austria"),
    countryTo:  Country(code: "ES", name: "Spain"),
    dTime: 1657278000,
    dTimeUTC: 1657270800,
    aTime: 1657299000,
    aTimeUTC:1657291800,
    flyDuration: "5h 50m",
    price: 114,
    route: [Route(id: "13a24aed00000327d0d2", flyFrom: "VIE", flyTo: "PMI", cityFrom: "Vienna", cityCodeFrom: "VIE", cityTo: "Palma,Majorca", cityCodeTo: "PMI", dTime: 1657278000, dTimeUTC: 1657270800, aTime: 1657299000, aTimeUTC: 1657291800, airline:"FR", flightNo: 104, price: 100),Route(id: "13a24aed00000327d0d2", flyFrom: "VIE", flyTo: "PMI", cityFrom: "Vienna", cityCodeFrom: "VIE", cityTo: "Palma,Majorca", cityCodeTo: "PMI", dTime: 1657278000, dTimeUTC: 1657270800, aTime: 1657299000, aTimeUTC: 1657291800, airline:"FR", flightNo: 104, price: 100)],
    bookingToken: "19ef13a24aed00000327d0d20|13a20a224aed0000a93843630",
    deepLink: "19ef13a24aed00000327d0d20|13a20a224aed0000a93843630",
    mapIdfrom: "vienna_at",
    mapIdto: "madrid_es")
}

