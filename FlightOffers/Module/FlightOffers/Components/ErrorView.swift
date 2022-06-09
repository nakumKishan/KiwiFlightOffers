//
//  ErrorView.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 08/06/22.
//
/*------------------------------------------------
 // ErrorView Information
 /*
  *Note:-
  Usage :- Used to show error with message on screen
  Parent Screen:- Common View
  Data Needed :- Error Message String , ViewModel Object
  */
 ------------------------------------------------*/

import SwiftUI
/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct ErrorView: View {
  let error : String
  @EnvironmentObject private var vm: FlightsViewModel
  var body: some View {
    VStack{
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.theme.cardColor)
        .frame(width: Constants.screenWidth * 0.7,height:300)
        .addBackgroundShadow()
        .overlay(
          VStack(alignment:.center){
            Text(error)
              .foregroundColor(Color.theme.fontColor)
            Spacer()
            Image.system.arrowClockwiseCircle
              .resizable()
              .foregroundColor(Color.theme.lightPink)
              .frame(width:Constants.screenWidth * 0.15 , height:Constants.screenWidth * 0.15, alignment: .center)
              .onTapGesture {
                withAnimation(.linear(duration: 1.0)) {
                  vm.reloadData()
                }
              }
          }
            .padding()
            .padding(.top,20)
        )
    }
  }
}

/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct ErrorView_Previews: PreviewProvider {
  static var previews: some View {
    ErrorView(error: "Something went wrong")
  }
}
