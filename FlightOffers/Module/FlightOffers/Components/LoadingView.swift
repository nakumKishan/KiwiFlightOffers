//
//  LoadingView.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 08/06/22.
//
/*------------------------------------------------
 // LoadingView Information
 /*
  *Note:-
  Usage :- Used to show Loading animation while API Calls
  Parent Screen:- Common View
  Data Needed :- NA
  */
 ------------------------------------------------*/

import SwiftUI
/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct LoadingView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .fill(Color.theme.cardColor)
      .frame(width: Constants.screenWidth * 0.5,height:200)
      .addBackgroundShadow()
      .overlay(
        VStack{
          Image.local.ticket
            .resizable()
            .frame(width: 70, height: 70)
          Text(Constants.placeholders.loadingText)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.top,20)
          ProgressView()
            .foregroundColor(Color.theme.lightPink)
          Spacer()
        }
          .padding(.top,40)
      )
  }
}

/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct LoadingView_Previews: PreviewProvider {
  static var previews: some View {
    LoadingView()
  }
}
