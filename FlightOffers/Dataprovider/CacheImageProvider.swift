//
//  CacheImageProvider.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // CacheImageProvider Information
 /*
  *Note:-
  Usage :- Responsible for handling Image Download and CacheStore
  */
 ------------------------------------------------*/

import UIKit
import Combine

class CacheImageProvider: ObservableObject {
  /*--------------------------------------------
   MARK: Variables & initializers
  --------------------------------------------*/
  @Published var image: UIImage?
  private var cancellable: AnyCancellable?

  private static let cache = NSCache<NSString, UIImage>()
  let url: URL

  init(url: URL) {
    self.url = url
  }

  deinit {
    cancel()
  }

  /*--------------------------------------------
   MARK: Function : If Object present in Cache or API CALL
  --------------------------------------------*/
  func load() {
    let urlString = url.absoluteString
    if let cachedImage = ImageCache.shared.object(forkey: url.absoluteString as NSString) {
      DispatchQueue.main.async {
        self.image = cachedImage
      }
    } else {
      cancellable = URLSession.shared.dataTaskPublisher(for: url)
        .map { UIImage(data: $0.data) }
        .retry(2)
        .replaceError(with: nil)
        .receive(on: DispatchQueue.main)
        .sink { [weak self] in
          self?.image = $0
          ImageCache.shared.set(object: $0!, forKey: urlString as NSString)
        }
    }

  }

  func cancel() {
    cancellable?.cancel()

  }

}
