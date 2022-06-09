//
//  DestinationHeader.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 09/06/22.
//
/*------------------------------------------------
 // DestinationHeader Information
 /*
  *Note:-
  Usage :- Used to show TopView of Destination Screen
  Parent Screen:- FlightView (App Main Screen)
  Data Needed :- AppStorage to change Dark/Lite Mode, ViewModel Object
  */
 ------------------------------------------------*/

import SwiftUI
/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct DestinationHeader: View {
  @EnvironmentObject private var vm: FlightsViewModel
  @AppStorage("isDarkMode") private var isDarkMode = false
  var body: some View {
    HStack{
      Text(Constants.placeholders.navTitle)
        .foregroundColor(Color.theme.fontColor)
        .font(.title)
        .fontWeight(.bold)
      Spacer()
      DarkModeToggle
      Spacer()
      RetryButton
    }
    .padding(.horizontal,30)
  }
}

/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct DestinationHeader_Previews: PreviewProvider {
  static var previews: some View {
    DestinationHeader()
      .previewLayout(.sizeThatFits)
  }
}

/*--------------------------------------------
 MARK: Main View Extension
 --------------------------------------------*/
extension DestinationHeader{
  /*--------------------------------------------
   MARK: View - DarkMode Toggle
   --------------------------------------------*/
  private var DarkModeToggle: some View {
    RoundedRectangle(cornerRadius: 20)
      .fill(Color.theme.cardColor)
      .frame(width:40,height:40)
      .addBackgroundShadow()
      .overlay(
        Button(action: {
          $isDarkMode.wrappedValue.toggle()
        }, label: {
          Image(systemName:$isDarkMode.wrappedValue ?"sun.max":"moon.fill")
            .foregroundColor($isDarkMode.wrappedValue ? Color.yellow : Color.black.opacity(0.7))
            .frame(width:40,height:40)
        })
      )
  }
  
  /*--------------------------------------------
   MARK: View - Retry Button
   --------------------------------------------*/
  private var RetryButton: some View {
    RoundedRectangle(cornerRadius: 20)
      .fill(Color.theme.cardColor)
      .frame(width:40,height:40)
      .addBackgroundShadow()
      .overlay(
        Button(action: {
          withAnimation(.linear(duration: 1.0)) {
            vm.reloadData()
          }
        }, label: {
          Image.system.goforward
            .foregroundColor(Color.pink)
            .frame(width:40,height:40)
        })
      )
    
  }
}
