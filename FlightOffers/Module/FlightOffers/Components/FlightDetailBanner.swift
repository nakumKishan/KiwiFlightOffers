//
//  FlightDetailBanner.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // FlightDetailBanner Information
 /*
  *Note:-
  Usage :- Common view used to show Flight details in Hstack Manner
  Parent Screen:- FlightsView  & FlightInfoView
  Data Needed :- Date,Price,Duration , View Attributes
  */
 ------------------------------------------------*/

import SwiftUI
/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct FlightDetailBanner: View {
  var frameHeight : CGFloat = 70
  var backgroundColor : Color = .clear
  let bannerData: (flyDate:Int?,price:String?,duration:String?)
  var fontColor : Color =  .black
  var body: some View {
    Rectangle()
      .fill(backgroundColor)
      .frame(height:frameHeight)
      .overlay(
        BannerView
      )
  }
}

/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct FlightDetailBanner_Previews: PreviewProvider {
  static var previews: some View {
    FlightDetailBanner(bannerData: (flyDate:dev.flight.dTime, price:dev.flight.finalPrice, duration:DateManager.shared.differenceBetweenDates(aTime: dev.flight.aTime!, dTime: dev.flight.dTime!)))
      .previewLayout(.sizeThatFits)
  }
}

/*--------------------------------------------
 MARK: Main View Extension
 --------------------------------------------*/
extension FlightDetailBanner{
  /*--------------------------------------------
   MARK: Banner Columns
   --------------------------------------------*/
  private var BannerView: some View {
    HStack() {
      BlockView(header: (text:Constants.placeholders.date, font:.caption, fontWeight:.semibold, color:fontColor), subHeader: (text:DateManager.shared.getDate(format: .dateOnly, timeStamp: bannerData.flyDate), font:.callout, fontWeight:.regular, color:fontColor),totalColumn: 4)
      Divider()
      BlockView(header: (text:Constants.placeholders.price, font: .caption, fontWeight:.semibold, color:fontColor), subHeader: (text:bannerData.price ?? Constants.emptyText, font: .callout, fontWeight:.regular, color:fontColor),totalColumn: 4)
      Divider()
      BlockView(header: (text:Constants.placeholders.duration, font: .caption, fontWeight:.semibold, color:fontColor), subHeader: (text:bannerData.duration ?? Constants.emptyText, font: .callout, fontWeight:.regular, color:fontColor),totalColumn: 4)
    }
  }

}
