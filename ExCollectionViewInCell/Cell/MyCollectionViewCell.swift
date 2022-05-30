//
//  MyCollectionViewCell.swift
//  ExCollectionViewInCell
//
//  Created by 김종권 on 2022/05/30.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
  static let id = "MyCollectionViewCell"
  
  private let colorView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.contentView.addSubview(self.colorView)
    
    NSLayoutConstraint.activate([
      self.colorView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
      self.colorView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
      self.colorView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
      self.colorView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
    ])
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    self.prepare(color: nil)
  }
  
  func prepare(color: UIColor?) {
    self.colorView.backgroundColor = color
  }
}
