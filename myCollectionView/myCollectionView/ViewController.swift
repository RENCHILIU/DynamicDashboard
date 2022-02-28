//
//  ViewController.swift
//  myCollectionView
//
//  Created by liurenchi on 2/20/22.
//

import UIKit

class ViewController: DYCollectionViewController {

  let myOperationQueue = OperationQueue()
  
  
  
  override func viewDidLoad() {
    
//    DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
//      if let cell = self.collectionView.cellForItem(at: IndexPath(row: 1, section: 0)) {
//        
//        self.heightList[1] = 50.0
//        self.collectionView.reloadItems(at: [IndexPath(row: 1, section: 0)])
//      }
//    })
//      
//    DispatchQueue.main.asyncAfter(deadline: .now() + 8, execute: {
//      if let cell = self.collectionView.cellForItem(at: IndexPath(row: 2, section: 0)) {
//        
//        self.heightList[2] = 60.0
//        self.collectionView.reloadItems(at: [IndexPath(row: 2, section: 0)])
//      }
//    })
//    
//    DispatchQueue.main.asyncAfter(deadline: .now() + 7, execute: {
//      if let cell = self.collectionView.cellForItem(at: IndexPath(row: 3, section: 0)) {
//        
//        self.heightList[3] = 60.0
//        self.collectionView.reloadItems(at: [IndexPath(row: 3, section: 0)])
//      }
//    })
//    DispatchQueue.main.asyncAfter(deadline: .now() + 6, execute: {
//      if let cell = self.collectionView.cellForItem(at: IndexPath(row: 4, section: 0)) {
//        
//        self.heightList[4] = 60.0
//        self.collectionView.reloadItems(at: [IndexPath(row: 4, section: 0)])
//      }
//    })
    
    for i in 0...4 {
      ramReload(second: i)
      print("ramReload")
    }
    
  }
  //TODO: swift generate a set of ram

  func ramReload(second: Int) {
    let countIndext = getRam()
    print(countIndext)
   
    DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(second), execute: {
      
//      if let cell = self.collectionView.cellForItem(at: index) {
        
       let label = UILabel()
        label.text = "\(second)"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let thisView = UIView()
        thisView.backgroundColor = .red
        thisView.translatesAutoresizingMaskIntoConstraints = false
        thisView.addSubview(label)
        
      let heightC = NSLayoutConstraint(item: thisView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 180.0)
      heightC.priority = UILayoutPriority(rawValue: 999)
              NSLayoutConstraint.activate([
                heightC,
                NSLayoutConstraint(item: thisView, attribute: .centerX, relatedBy: .equal, toItem: label, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: thisView, attribute: .centerY, relatedBy: .equal, toItem: label, attribute: .centerY, multiplier: 1, constant: 0)
              ])
        
        self.heightList[countIndext].containerView = thisView

        
       
//      }
    })
 
  }
  
  
  func getRam() -> Int {
    return Int.random(in: 0...heightList.count-1)
  }

}

