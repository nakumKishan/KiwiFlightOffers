//
//  FlightDetailTopView.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 07/06/22.
//
/*------------------------------------------------
 // FlightDetailTopView Information
 /*
  *Note:-
  Usage :- View used to Flight Detail Screen Top View (with Animation)
  Parent Screen:- FlightInfoView (Flight detail Screen)
  Data Needed :- Arrival and Departure details Needed
  */
 ------------------------------------------------*/

import SwiftUI
/*--------------------------------------------
 MARK: Main View
 --------------------------------------------*/
struct FlightDetailTopView: View {
  let originName :String?
  let destinationName :String?
  let destinationCode :String?
  let originCode :String?
  @State var showingSubview = false
  var body: some View {
    HStack {
      CityCodeView(alignment: .leading, topLabelText: originCode ?? Constants.emptyText, bottomLabelText: originName ?? Constants.emptyText, fontSize: 28,color:.white)
      Spacer()
      FlightPathView
      Spacer()
      CityCodeView(alignment: .trailing, topLabelText: destinationCode ?? Constants.emptyText, bottomLabelText: destinationName ?? Constants.emptyText, fontSize: 28,color:.white)
    }
    .padding(.horizontal, 20.0)
    .padding(.bottom, 8.0)
    .frame(maxWidth: .infinity)
    .onAppear {
      showingSubview.toggle()
    }
  }
}

/*--------------------------------------------
 MARK: View Preview
 --------------------------------------------*/
struct FlightDetailTopView_Previews: PreviewProvider {
  static var previews: some View {
    FlightDetailTopView(originName: dev.flight.cityFrom, destinationName: dev.flight.cityTo, destinationCode: dev.flight.cityCodeTo, originCode: dev.flight.cityCodeFrom)
      .background(Color.black)
      .previewLayout(.sizeThatFits)
  }
}

/*--------------------------------------------
 MARK: Main View Extension
 --------------------------------------------*/
extension FlightDetailTopView{
  /*--------------------------------------------
   MARK: View used to Draw path & Airplane Animation
   --------------------------------------------*/
  private var FlightPathView: some View {
    VStack {
      ZStack{
        HStack(spacing: .zero) {
          Circle()
            .stroke(lineWidth: 2.0)
            .fill(Color.pink)
            .frame(width: 6.0, height: 6.0)
          Rectangle()
            .fill(Color.pink)
            .frame(height: 1.0)
            .overlay(
              GeometryReader { geo in
                Image.system.airplaneCircleFill
                  .resizable()
                  .scaledToFit()
                  .frame(width: 34.0)
                  .frame(height: 34.0)
                  .foregroundColor(.pink)
                  .padding(.horizontal, 8.0)
                  .background(
                    Circle()
                      .fill(.white)
                  )
                  .offset(x:showingSubview ? geo.size.width - 45 :0, y:-15)
                  .animation(Animation.linear(duration: 20).repeatForever(autoreverses: false))
              }
            )
          
          Circle()
            .stroke(lineWidth: 2.0)
            .fill(Color.pink)
            .frame(width: 6.0, height: 6.0)
        }
      }
      Text(Constants.emptyText)
        .font(.caption)
        .fontWeight(.semibold)
    }
    .offset(x: .zero, y: 4.0)
  }
}


