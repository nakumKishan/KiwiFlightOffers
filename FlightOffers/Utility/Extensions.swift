//
//  Extensions.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 08/06/22.
//
/*------------------------------------------------
 // Extensions Information
 /*
  *Enums:-
  View : Add Modiefiers to SwiftUI Views using View Extensions
  Encodable : Use to Encode struct into Json Dictionary
  URLComponents : Used to create Query Parameters
  */
 ------------------------------------------------*/

import Foundation
import SwiftUI

/*--------------------------------------------
 MARK: Extension-View
 /*
  Ex. Text("Example")
        .addGradientLayerToBottom()
  */
 --------------------------------------------*/
extension View {
  func addBackgroundShadow(with lightColor:Color = Color.theme.lightShadow,darkColor:Color = Color.theme.darkShadow) -> some View {
    modifier(BackgroundShadow(lightColor: lightColor, darkColor: darkColor))
  }

  func addGradientLayerToBottom() -> some View {
    modifier(BottomGradientLayer())
  }

}

/*--------------------------------------------
 MARK: Extension-Encodable
 /*
  Ex. model(par1:,par2:....).asDictionary()
  */
 --------------------------------------------*/
extension Encodable {
  func asDictionary() ->  [String: String]? {
    do{
      let data = try JSONEncoder().encode(self)
      guard let dictionary = try JSONSerialization.jsonObject(with: data, options:[]) as?  [String: String] else { return nil }
      return dictionary
    }catch{ return nil }
  }
}

/*--------------------------------------------
 MARK: Extension-URLComponents
 --------------------------------------------*/
extension URLComponents {
  mutating func setQueryItems(with parameters: [String: String]) {
    self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
  }
}
