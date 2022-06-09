//
//  CacheImageLoader.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // ImageCache Information
 /*
  *Note:-
  - ImageCache used to Define Cache object with specific storage limit
    and used to store Images
  */
 ------------------------------------------------*/

import UIKit

class ImageCache {

  /*--------------------------------------------
   MARK: Variables & initializers
   --------------------------------------------*/
  typealias CacheType = NSCache<NSString, UIImage>

  static let shared = ImageCache()

  private init() {}

  private lazy var cache: CacheType = {
    let cache = CacheType()
    cache.countLimit = 1000
    cache.totalCostLimit = 50 * 1024 * 1024
    return cache
  }()

  /*--------------------------------------------
   MARK: Object ADD & Retrive Methods
   --------------------------------------------*/
  func object(forkey key: NSString) -> UIImage? {
    cache.object(forKey: key)
  }

  func set(object: UIImage, forKey key: NSString) {
    cache.setObject(object, forKey: key)
  }
}
