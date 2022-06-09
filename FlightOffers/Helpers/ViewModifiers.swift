//
//  ViewModifiers.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // ViewModifiers Information
 /*
  *Note:-
  - This calss is used to add Predefine modifier to swiftui views
  */
 ------------------------------------------------*/

import Foundation
import SwiftUI

/*---------------------------------------------------
 MARK: ViewModifier - Add background shadow to anyview
-----------------------------------------------------*/
struct BackgroundShadow: ViewModifier {
  
  var lightColor: Color
  var darkColor: Color

  func body(content: Content) -> some View {
    content
      .shadow(color: lightColor, radius: 8, x: -8, y: -8)
      .shadow(color: darkColor, radius: 8, x: 8, y: 8)
  }
}

/*-----------------------------------------------------
 MARK: ViewModifier - Add bottom Gradient Layer to Image
-------------------------------------------------------*/
struct BottomGradientLayer: ViewModifier {
  func body(content: Content) -> some View {
    content
      .overlay(
        VStack {
          Spacer()
          Rectangle()
            .foregroundColor(.clear)
            .background(LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
        }
      )
  }
}
