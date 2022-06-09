//
//  DestinationCard.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // DestinationCard Information
 /*
  *Note:-
  Usage :- View used to provide CardView on MainScreen
  Parent Screen:- FlightsView (App Main Screen)
  Data Needed :- Flight Object
  */
 ------------------------------------------------*/

import SwiftUI

/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct DestinationCard: View {
  let flight: Flight
  let price : String?
  var body: some View {
    ZStack{
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.theme.cardColor)
        .addBackgroundShadow()
      VStack{
        CardImage
        VStack {
          BlockView(header: (text:flight.cityTo ?? Constants.emptyText, font: .largeTitle, fontWeight:.bold, color:Color.theme.fontColor), subHeader: (text: flight.countryTo?.name ?? Constants.emptyText, font: .subheadline, fontWeight:.regular, color:Color.theme.fontColor),totalColumn: 1)
          Spacer()
          FlightDetailBanner(frameHeight:70,backgroundColor:Color.theme.lightPink,bannerData: (flyDate: flight.dTime, price:price, duration:DateManager.shared.differenceBetweenDates(aTime: flight.aTime ?? 0, dTime: flight.dTime ?? 0)))
          Spacer()
          Image.system.chevronDownFill
            .resizable()
            .foregroundColor(Color.theme.lightPink)
            .frame(width:Constants.screenWidth * 0.15 , height:Constants.screenWidth * 0.15, alignment: .center)
            .addBackgroundShadow()
        }
        .padding(.top,10)
        .padding(.bottom,20)
      }
    }
    
  }
}


/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct DestinationCard_Previews: PreviewProvider {
  static var previews: some View {
    DestinationCard(flight: dev.flight, price: dev.flight.finalPrice)
      .previewLayout(.sizeThatFits)
      .preferredColorScheme(.dark)
  }
}


/*--------------------------------------------
 MARK: Main View Extension
 --------------------------------------------*/
extension DestinationCard{
  /*--------------------------------------------
   MARK: View - Topscreen Image View
   --------------------------------------------*/
  private var CardImage: some View {
    CacheImage(url:flight.destinationImageURL)
      .id(Date.timeIntervalSinceReferenceDate)
      .aspectRatio(contentMode: .fit)
      .clipShape(Circle())
      .padding(.all, 8)
      .background( Color.theme.background)
      .clipShape(Circle())
      .addBackgroundShadow()
      .padding(.top,20)
  }
  
}
