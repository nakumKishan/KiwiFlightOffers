//
//  CityCodeView.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 07/06/22.
//
/*------------------------------------------------
 // CityCodeView Information
 /*
  *Note:-
  Parent Screen:- FlightInfoView
  Data Needed :- Top & bottom label Texts , View Attributes
  */
 ------------------------------------------------*/

import SwiftUI
/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct CityCodeView: View {
  let alignment : HorizontalAlignment
  let topLabelText:String
  let bottomLabelText:String
  var fontSize : CGFloat
  let color :Color
  var body: some View {
    VStack(alignment:alignment) {
      Text(topLabelText)
        .font(.system(size: fontSize))
        .font(.title3)
        .fontWeight(.heavy)
        .foregroundColor(color)
      Text(bottomLabelText)
        .font(.caption)
        .fontWeight(.semibold)
        .foregroundColor(color)
    }
  }
}

/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct CityCodeView_Previews: PreviewProvider {
  static var previews: some View {
    CityCodeView(alignment:.center , topLabelText:dev.flight.cityCodeFrom ?? Constants.emptyText, bottomLabelText: dev.flight.cityFrom ?? Constants.emptyText, fontSize: 28,color:.black)
      .previewLayout(.sizeThatFits)
  }
}
