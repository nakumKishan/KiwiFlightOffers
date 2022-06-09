//
//  FlightsView.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // FlightsView Information
 /*
  *Note:-
  Usage :- Used to show Main Screen of App
  Parent Screen:- NA
  Data Needed :- Flights Data to show cards, ViewModel Object
  */
 ------------------------------------------------*/
import SwiftUI

/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct FlightsView: View {
  @EnvironmentObject private var vm: FlightsViewModel
  @State var showFlightDetail = false
  @State private var selectedFlight: Flight? = nil
  @AppStorage("isDarkMode") private var isDarkMode = false
  
  var body: some View {
    
    ZStack {
      // background layer
      Color.theme.background
        .ignoresSafeArea()
        .sheet(isPresented:$showFlightDetail) {
          FlightInfoView(selectedFlight:$selectedFlight)
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
      switch vm.state {
      case .idle:
        Color.red.onAppear(perform: vm.reloadData)
      case .loading:
        LoadingView()
      case .failed(let error):
        ErrorView(error: error)
          .environmentObject(vm)
      case .loaded:
        VStack{
          DestinationHeader()
          if vm.allFlights.count > 0{
            destinationList
          }
          Spacer()
        }
        .padding(.top)
      }
    }.onAppear {
      UIPageControl.appearance().currentPageIndicatorTintColor = .systemPink
      UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemPink.withAlphaComponent(0.2)
      UIScrollView.appearance().bounces = false
    }
  }
}


/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct FlightsView_Previews: PreviewProvider {
  static var previews: some View {
    FlightsView()
      .environmentObject(dev.vm)
  }
}

/*--------------------------------------------
 MARK: Main View Extension
 --------------------------------------------*/
extension FlightsView{
  /*--------------------------------------------
   MARK: View - CardView of Destinations
   --------------------------------------------*/
  private var destinationList: some View {
    TabView {
      ForEach(vm.allFlights.indices) { i in
        DestinationCard(flight:vm.allFlights[i], price:vm.allFlights[i].finalPrice)
          .padding(.horizontal,30)
          .padding(.bottom, 70)
          .onTapGesture {
            showFlightDetail = true
            selectedFlight = vm.allFlights[i]
          }
      }
    }
    .padding(.top,30)
    .padding(.bottom,30)
    .tabViewStyle(.page(indexDisplayMode: .always))
  }
}
