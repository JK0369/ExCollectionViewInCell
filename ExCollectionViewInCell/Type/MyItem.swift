//
//  MyItem.swift
//  ExCollectionViewInCell
//
//  Created by 김종권 on 2022/05/30.
//

import Foundation
import UIKit

enum MyItem: Equatable {
  case thumbnail(UIImage?, String) // thumbnailImage, name
  case collection(String, [CollectionViewItem]) // name, collection
}

enum CollectionViewItem: Equatable {
  case color(UIColor)
}
