//
//  MyTableViewCellOne.swift
//  ExCollectionViewInCell
//
//  Created by 김종권 on 2022/05/30.
//

import UIKit

final class MyTableViewCellOne: UITableViewCell {
  static let id = "MyTableViewCellOne"
  
  private let thumbnailImageView: RoundImageView = {
    let view = RoundImageView()
    view.clipsToBounds = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private let label: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 24)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.contentView.addSubview(self.thumbnailImageView)
    self.contentView.addSubview(self.label)
    
    NSLayoutConstraint.activate([
      self.thumbnailImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
      self.thumbnailImageView.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor),
      self.thumbnailImageView.heightAnchor.constraint(equalToConstant: 120),
      self.thumbnailImageView.widthAnchor.constraint(equalToConstant: 120),
    ])
    NSLayoutConstraint.activate([
      self.label.topAnchor.constraint(equalTo: self.thumbnailImageView.bottomAnchor, constant: 4),
      self.label.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
      self.label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
      self.label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
    ])
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(image: nil, name: nil)
  }
  
  func prepare(image: UIImage?, name: String?) {
    self.thumbnailImageView.image = image
    self.label.text = name
  }
}

class RoundImageView: UIImageView {
  override func layoutSubviews() {
    super.layoutSubviews()
    guard self.frame.width == self.frame.height else { return }
    self.layer.cornerRadius = self.frame.width / 2
  }
}
