//
//  MyTableViewCellTwo.swift
//  ExCollectionViewInCell
//
//  Created by 김종권 on 2022/05/30.
//

import UIKit

final class MyTableViewCellTwo: UITableViewCell {
  static let id = "MyTableViewCellTwo"
  static let cellHeight = 300.0
  
  private let label: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 25)
    label.numberOfLines = 0
    label.textColor = .gray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 8.0
    layout.minimumInteritemSpacing = 0
    layout.itemSize = .init(width: 300, height: cellHeight)
    return layout
  }()
  lazy var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
    view.isScrollEnabled = true
    view.showsHorizontalScrollIndicator = false
    view.showsVerticalScrollIndicator = true
    view.contentInset = .zero
    view.backgroundColor = .clear
    view.clipsToBounds = true
    view.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.id)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private var items = [CollectionViewItem]()
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    self.collectionView.dataSource = self
    
    self.contentView.addSubview(self.label)
    self.contentView.addSubview(self.collectionView)

    NSLayoutConstraint.activate([
      self.label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
      self.label.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
      self.label.topAnchor.constraint(equalTo: self.contentView.topAnchor),
    ])
    NSLayoutConstraint.activate([
      self.collectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
      self.collectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
      self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
      self.collectionView.topAnchor.constraint(equalTo: self.label.bottomAnchor),
    ])
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(name: nil, items: [])
  }
  
  func prepare(name: String?, items: [CollectionViewItem]) {
    self.label.text = name
    self.items = items
    self.collectionView.dataSource = self
  }
}

extension MyTableViewCellTwo: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.items.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch self.items[indexPath.item] {
    case let .color(color):
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
      cell.prepare(color: color)
      return cell
    }
  }
}
