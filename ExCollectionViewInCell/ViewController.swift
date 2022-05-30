//
//  ViewController.swift
//  ExCollectionViewInCell
//
//  Created by 김종권 on 2022/05/30.
//

import UIKit

class ViewController: UIViewController {
  private let tableView: UITableView = {
    let view = UITableView()
    view.allowsSelection = false
    view.backgroundColor = .clear
    view.separatorStyle = .none
    view.bounces = true
    view.showsVerticalScrollIndicator = true
    view.contentInset = .zero
    view.register(MyTableViewCellOne.self, forCellReuseIdentifier: MyTableViewCellOne.id)
    view.register(MyTableViewCellTwo.self, forCellReuseIdentifier: MyTableViewCellTwo.id)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var items: [MyItem] = [
    .thumbnail(UIImage(named: "flower"), "iOS flower"),
    .thumbnail(UIImage(named: "flower"), "iOS thumbnail"),
    .thumbnail(UIImage(named: "flower"), "iOS image"),
    .collection("<Color List>", [
      .color(randomColor),
      .color(randomColor),
      .color(randomColor),
      .color(randomColor),
      .color(randomColor),
      .color(randomColor),
      .color(randomColor),
      .color(randomColor),
      
    ]),
    .thumbnail(UIImage(named: "flower"), "iOS capture"),
    .thumbnail(UIImage(named: "flower"), "iOS development"),
    .thumbnail(UIImage(named: "flower"), "iOS jake"),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.tableView)
    NSLayoutConstraint.activate([
      self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
    ])
    
    self.tableView.dataSource = self
    self.tableView.delegate = self
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.items.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch self.items[indexPath.item] {
    case let .thumbnail(image, name):
      let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCellOne.id, for: indexPath) as! MyTableViewCellOne
      cell.prepare(image: image, name: name)
      return cell
    case let .collection(name, items):
      let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCellTwo.id, for: indexPath) as! MyTableViewCellTwo
      cell.prepare(name: name, items: items)
      return cell
    }
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch self.items[indexPath.item] {
    case .thumbnail:
      return UITableView.automaticDimension
    case .collection:
      return MyTableViewCellTwo.cellHeight
    }
  }
}
