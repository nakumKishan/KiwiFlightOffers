//
//  CacheImage.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // CacheImage Information
 /*
  *Note:-
  Usage :- Used to implement AsyncImage feature before iOS 15
  Parent Screen:- Common View
  Data Needed :- ImageURL , CacheProvider
  */
 ------------------------------------------------*/

import Foundation
import SwiftUI
/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct CacheImage: View {

  @StateObject private var loader: CacheImageProvider
  init(url: URL) {
    _loader = StateObject(wrappedValue: CacheImageProvider(url: url))
  }

  var body: some View {
    ZStack{
      if loader.image != nil {
        Image(uiImage: loader.image!)
          .resizable()

      }else{
        Image(uiImage:Image.local.placeholder!)
          .resizable()
      }
    }.onAppear {
      loader.load()
    }
  }
}
