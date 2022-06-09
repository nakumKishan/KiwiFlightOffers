//
//  FlightOffersApp.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//

import SwiftUI

@main
struct FlightOffersApp: App {

  @StateObject private var vm = FlightsViewModel(provider: FlightDataProvider())
  @AppStorage("isDarkMode") private var isDarkMode = false
  @State private var showLaunchView: Bool = true
  var body: some Scene {
    WindowGroup {
      ZStack {
        FlightsView()
          .environmentObject(vm)
          .preferredColorScheme(isDarkMode ? .dark : .light)
      }
    }
  }
}
