//
//  FlightDetailCard.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 07/06/22.
//
/*------------------------------------------------
 // FlightDetailCard Information
 /*
  *Note:-
  Usage :- View used to provide Flight route card
  Parent Screen:- FlightInfoView (Flight detail Screen)
  Data Needed :- Route , Booleans(values to handle view Height),
  NextFlightTime(to count Layover)
  */
 ------------------------------------------------*/

import SwiftUI
/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct FlightDetailCard: View {
  @State var reached = false
  let flightRoute: Route
  let showTopView : Bool
  let showBottomView :Bool
  let yOffSet : CGFloat
  let showDate : Bool
  let showLayover : Bool
  let nextFlightTime : Int?
  var body: some View {
    ZStack{
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.theme.cardColor)
        .addBackgroundShadow()
      HStack{
        FlightTimingView
          .padding(.leading,20)
        FlightPath
        FlightCitiesView
          .overlay(
            outerLayerTexts
              .frame(width:200)
              .padding(.leading,30)
          )
        Spacer()
      }
    }
    .padding(.horizontal,20)
    .padding(.top,showDate ? 120 : 70)
    .padding(.bottom,showLayover ? 70 : 120)
    .frame(maxWidth:.infinity)
    .frame(height:showDate ? 245  : 245 - (yOffSet/2) )
  }
}

/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct FlightDetailCard_Previews: PreviewProvider {
  static var previews: some View {
    VStack{
      FlightDetailCard(flightRoute:(dev.flight.route?.first)!, showTopView: true, showBottomView: true, yOffSet: 0, showDate: true, showLayover: false, nextFlightTime: dev.flight.aTime)
      //      FlightDetailCard(flightRoute:(dev.flight.route?.first)!, showTopView: true, showBottomView: false, yOffSet: 0, showDate: false, showLayover: false, nextFlightTime: dev.flight.aTime)
    } .previewLayout(.sizeThatFits)
    
  }
}

/*--------------------------------------------
 MARK: Main View Extension
 --------------------------------------------*/
extension FlightDetailCard{
  /*-------------------------------------------------
   MARK: View to show Departure and Arrival Time Vstack (First Column)
   ------------------------------------------------*/
  private var FlightTimingView: some View {
    VStack(alignment: .center){
      Text(DateManager.shared.getDate(format: .timeOnly, timeStamp: flightRoute.dTime))
        .foregroundColor(Color.theme.fontColor)
        .font(.subheadline)
        .fontWeight(.semibold)
        .padding(.top,15)
      Spacer()
      Image.system.clock
        .resizable()
        .scaledToFit()
        .foregroundColor(Color.theme.fontColor)
        .frame(width: 15, height: 15,alignment: .center)
      Text(DateManager.shared.differenceBetweenDates(aTime: (flightRoute.aTime ?? 0), dTime: (flightRoute.dTime ?? 0)))
        .foregroundColor(Color.theme.fontColor)
        .font(.caption2)
        .fontWeight(.thin)
      Spacer()
      Text(DateManager.shared.getDate(format: .timeOnly, timeStamp: flightRoute.aTime))
        .foregroundColor(Color.theme.fontColor)
        .font(.subheadline)
        .fontWeight(.semibold)
        .padding(.bottom,15)
    }
    .frame(width:60)
  }
  
  /*-------------------------------------------------
   MARK: View to Flight Path Visulisation (Second Column)
   ------------------------------------------------*/
  private var FlightPath: some View {
    ZStack{
      Rectangle()
        .fill(Color.pink.opacity(0.5))
        .frame(width: 0.5)
      //        .padding(30)
        .padding(.horizontal,30)
        .padding(.top,(showTopView) ? -15 : 30 )
        .padding(.bottom,showBottomView ? -15 : 30)
      outerLayer
      VStack{
        FlightPathCircle
          .padding(.top,20)
        Spacer()
        Image.system.airplane
          .resizable()
          .scaledToFit()
          .foregroundColor(Color.pink)
          .rotationEffect(Angle(degrees: 90))
          .frame(width: 25, height: 25, alignment: .center)
        Spacer()
        FlightPathCircle
          .padding(.bottom,20)
      }
    }
    .frame(width:45)
  }
  
  /*-------------------------------------------------------------
   MARK: View to show Arrival/Departure Cities Information (Third Column)
   --------------------------------------------------------------*/
  private var FlightCitiesView: some View {
    VStack(alignment:.leading){
      CityCodeView(alignment: .leading, topLabelText: flightRoute.cityCodeFrom ?? Constants.emptyText, bottomLabelText: flightRoute.cityFrom ?? Constants.emptyText,fontSize: 20,color:Color.theme.fontColor)
        .padding(.top,10)
      Spacer()
      CacheImage(url: flightRoute.airlineImageURL)
        .scaledToFit()
        .frame(width: 40, height: 40,alignment: .center)
      Spacer()
      CityCodeView(alignment: .leading, topLabelText: flightRoute.cityCodeTo ?? Constants.emptyText, bottomLabelText: flightRoute.cityTo ?? Constants.emptyText,fontSize: 20,color:Color.theme.fontColor)
        .padding(.bottom,15)
    }
  }
  
  
  private var FlightPathCircle: some View {
    Circle()
      .fill(Color.white)
      .frame(width: 10,height: 10)
      .background(
        Circle()
          .fill(Color.pink)
          .frame(width: 18,height: 18)
      )
  }
  
  /*-------------------------------------------------------------
   MARK: Views to show Calendar and Layover Section
   --------------------------------------------------------------*/
  private var outerLayer : some View{
    VStack{
      if showDate{
        VStack{
          Image.system.calendarCircleFill
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.pink)
            .frame(width: 20, height: 20, alignment: .center)
            .offset(x:0, y:-30)
        }
      }
      Spacer()
      if showLayover{
        VStack{
          Image.system.clockFill
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.pink)
            .frame(width: 20, height: 20, alignment: .center)
            .offset(x:0, y:35)
          
        }
      }
    }
  }
  
  private var outerLayerTexts : some View{
    VStack(alignment:.leading){
      if showDate{
        Text(DateManager.shared.getDate(format: .fullDate, timeStamp: (flightRoute.dTime  ?? 0)))
          .font(.caption)
          .fontWeight(.semibold)
          .foregroundColor(Color.theme.fontColor)
          .offset(x:(showLayover ? 0 : -30), y:-27)
      }
      Spacer()
      if showLayover{
        Text("\(DateManager.shared.differenceBetweenDates(aTime: (nextFlightTime ?? 0), dTime: (flightRoute.aTime  ?? 0))) layover")
          .font(.caption)
          .fontWeight(.semibold)
          .foregroundColor(Color.theme.fontColor)
          .offset(x: 0, y:32)
      }
    }
  }
}
