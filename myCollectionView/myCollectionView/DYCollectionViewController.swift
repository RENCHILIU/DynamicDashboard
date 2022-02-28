//
//  DYCollectionViewController.swift
//  myCollectionView
//
//  Created by liurenchi on 2/24/22.
//

import UIKit

class DYTile {
  
  weak var delegate: DYCollectionViewControllerDelegate?
  
  var ID = 0
  init() {
    
    let thisView = UIView()
    thisView.backgroundColor = .brown
    thisView.translatesAutoresizingMaskIntoConstraints = false
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(thisView)
    
    let heightC = NSLayoutConstraint(item: thisView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80.0)
    heightC.priority = UILayoutPriority(rawValue: 999)
          NSLayoutConstraint.activate([
            heightC,
            NSLayoutConstraint(item: thisView, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: thisView, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: thisView, attribute: .left, relatedBy: .equal, toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: thisView, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0)
          ])
  }
    
  var containerView = UIView() {
    didSet{
      delegate?.update(id: ID)
    }
  }
  
}

protocol DYCollectionViewControllerDelegate: AnyObject {
  func update(id: Int)
}

class DYCollectionViewController: UIViewController, DYCollectionViewControllerDelegate {
  func update(id: Int) {
    
    if let cell = collectionView.cellForItem(at: IndexPath(row: id, section: 0)) {
      UIView.performWithoutAnimation {
        let loc = collectionView.contentOffset
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        collectionView.contentOffset = loc
      }
    }
  }
  

  
  var signal = [false, false]
  var heightList = [DYTile(), DYTile(), DYTile(), DYTile(), DYTile(), DYTile(), DYTile(),DYTile(), DYTile(), DYTile(), DYTile(), DYTile(), DYTile(), DYTile()]
  
  
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
  
  override func loadView() {
    view = collectionView
    collectionView.register(DYCollectionViewCell.self, forCellWithReuseIdentifier: "DYCollectionViewCell")
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    
    let flow = UICollectionViewFlowLayout()
    flow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    
    collectionView.collectionViewLayout = flow
    var i = 0
    heightList.map{
      $0.delegate = self
      $0.ID = i
      i = i + 1
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DYCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return heightList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DYCollectionViewCell", for: indexPath)
    cell.contentView.subviews.map{$0.removeFromSuperview()}
   

    
//    heightList.map { print($0) }
//    print("+++++++++")
    
  
     
    let myContainerView = heightList[indexPath.row].containerView
      
    cell.contentView.addSubview(myContainerView)
//      let heightC = NSLayoutConstraint(item: thisView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0)
//      heightC.priority = UILayoutPriority(rawValue: 999)
//
      let widthC = NSLayoutConstraint(item: myContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: view.frame.width - 20)
      widthC.priority = UILayoutPriority(rawValue: 999)
      
      NSLayoutConstraint.activate([
//        heightC,
        widthC,
//        NSLayoutConstraint(item: myContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: view.frame.width - 20),
        NSLayoutConstraint(item: myContainerView, attribute: .top, relatedBy: .equal, toItem: cell.contentView, attribute: .top, multiplier: 1.0, constant: 0.0),
        NSLayoutConstraint(item: myContainerView, attribute: .bottom, relatedBy: .equal, toItem: cell.contentView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        NSLayoutConstraint(item: myContainerView, attribute: .left, relatedBy: .equal, toItem: cell.contentView, attribute: .left, multiplier: 1.0, constant: 0.0),
        NSLayoutConstraint(item: myContainerView, attribute: .right, relatedBy: .equal, toItem: cell.contentView, attribute: .right, multiplier: 1.0, constant: 0.0)
      ])
      
      
//    } else {
//
//      let heightC = NSLayoutConstraint(item: thisView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80.0)
//      heightC.priority = UILayoutPriority(rawValue: 999)
//
//      let widthC = NSLayoutConstraint(item: thisView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: view.frame.width - 20)
//      widthC.priority = UILayoutPriority(rawValue: 999)
//      NSLayoutConstraint.activate([
//        heightC,
//        widthC,
//        NSLayoutConstraint(item: thisView, attribute: .top, relatedBy: .equal, toItem: cell.contentView, attribute: .top, multiplier: 1.0, constant: 0.0),
//        NSLayoutConstraint(item: thisView, attribute: .bottom, relatedBy: .equal, toItem: cell.contentView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
//        NSLayoutConstraint(item: thisView, attribute: .left, relatedBy: .equal, toItem: cell.contentView, attribute: .left, multiplier: 1.0, constant: 0.0),
//        NSLayoutConstraint(item: thisView, attribute: .right, relatedBy: .equal, toItem: cell.contentView, attribute: .right, multiplier: 1.0, constant: 0.0)
//      ])
//    }
//    cell.updateConstraintsIfNeeded()
//    cell.contentView.setNeedsLayout()
//    cell.contentView.layoutIfNeeded()
    
    
    
    
    return cell
  }
  
}

//extension DYCollectionViewController: UICollectionViewDelegateFlowLayout {
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//    return CGSize(width: view.frame.width - (sectionInsets.left + sectionInsets.right), height: heightList[indexPath.row])
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//    return sectionInsets
//  }
//
//
//}
