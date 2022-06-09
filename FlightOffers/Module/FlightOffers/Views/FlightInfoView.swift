//
//  FlightInfoView.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 07/06/22.
//
/*------------------------------------------------
 // FlightInfoView Information
 /*
  *Note:-
  Usage :- Used to show Destination Detail Screen
  Parent Screen:- NA
  Data Needed :- Selected Flight Object
  */
 ------------------------------------------------*/

import SwiftUI
/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct FlightInfoView: View {
  @Binding var selectedFlight: Flight?
  var body: some View {
    ZStack {
      Color.theme.background
        .ignoresSafeArea()
      if let flight = selectedFlight{
        ScrollView(showsIndicators: false){
          VStack{
            CacheImage(url: flight.destinationImageURL)
              .cornerRadius(10)
              .aspectRatio(4/3, contentMode: .fill)
              .addGradientLayerToBottom()
            FlightDetailTopView(
              originName: flight.cityFrom,
              destinationName: flight.cityTo,
              destinationCode: flight.cityCodeTo,
              originCode: flight.cityCodeFrom
            )
              .offset(x: 0, y: -80)
            flightDetailBody
          }
        }
      }
    }
  }
}

/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct FlightInfoView_Previews: PreviewProvider {
  static var previews: some View {
    FlightInfoView(selectedFlight:.constant(dev.flight))
  }
}


/*--------------------------------------------
 MARK: Main View Extension
 --------------------------------------------*/
extension FlightInfoView{
  /*--------------------------------------------
   MARK: View - Flights Route Cards View
   --------------------------------------------*/
  private var flightDetailBody: some View {
    VStack{
      if let flight = selectedFlight{
        FlightDetailBanner(frameHeight:50,backgroundColor:Color.clear,bannerData: (flyDate:flight.dTime, price:flight.finalPrice, duration:DateManager.shared.differenceBetweenDates(aTime: flight.aTime ?? 0, dTime: flight.dTime ?? 0)),fontColor: Color.theme.fontColor)
          .padding(.horizontal)
          .padding(.top,-20)
        if let routes = flight.route{
          if routes.count > 0{
            VStack{
              ForEach(routes.indices) { i in
                switch (i){
                case 0:
                  FlightDetailCard(flightRoute: routes[i], showTopView: true, showBottomView:  routes.count == 1 ? false : true, yOffSet: 0, showDate: true, showLayover: routes.count == 1 ? false : true,nextFlightTime: routes.count == 1 ? nil : routes[i+1].dTime)
                case (routes.count-1):
                  FlightDetailCard(flightRoute: routes[i], showTopView: true, showBottomView: false, yOffSet: 0, showDate: false, showLayover: false,nextFlightTime: nil)
                default:
                  FlightDetailCard(flightRoute: routes[i], showTopView: true, showBottomView: true, yOffSet: 90, showDate: false, showLayover: true,nextFlightTime:routes[i+1].dTime)
                }
              }
            }
            .padding(.bottom,50)
          }
        }
        Spacer()
      }
    }
    .padding(.top,-50)
    
  }
  
}
