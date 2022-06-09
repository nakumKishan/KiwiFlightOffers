//
//  BlockView.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // BlockView Information
 /*
  *Note:-
  Parent Screen:- Common View
  Data Needed :- Top & bottom label Texts , View Attributes
  */
 ------------------------------------------------*/

import SwiftUI

/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct BlockView: View {

  let header : (text:String,font:Font,fontWeight:Font.Weight,color:Color)
  let subHeader : (text:String,font:Font,fontWeight:Font.Weight,color:Color)
  let totalColumn: Int

  var body: some View {
    VStack(spacing: 4.0) {
      Text(header.text)
        .font(header.font)
        .fontWeight(header.fontWeight)
        .foregroundColor(header.color)

      Text(subHeader.text)
        .font(subHeader.font)
        .fontWeight(subHeader.fontWeight)
        .foregroundColor(subHeader.color)
    }
    .frame(width: (UIScreen.main.bounds.width - 80) / CGFloat(totalColumn))
  }
}

/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct BlockView_Previews: PreviewProvider {
  static var previews: some View {
    BlockView(header: (text: "London", font: .largeTitle, fontWeight:.bold, color:.black), subHeader: (text: "United Kingdom", font: .subheadline, fontWeight:.regular, color:.black),totalColumn: 2)
      .previewLayout(PreviewLayout.sizeThatFits)
  }
}
