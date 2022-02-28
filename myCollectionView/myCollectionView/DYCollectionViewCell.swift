//
//  DYCollectionViewCell.swift
//  myCollectionView
//
//  Created by liurenchi on 2/24/22.
//

import UIKit

class DYCollectionViewCell: UICollectionViewCell {
  
  
  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {

    layoutAttributes.bounds.size.height = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    layoutAttributes.bounds.size.width = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).width
    return layoutAttributes
  }
  
//  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//    super.preferredLayoutAttributesFitting(layoutAttributes)
//    setNeedsLayout()
//    layoutIfNeeded()
//    let layoutAttributesCopy = layoutAttributes
//    
//    layoutAttributesCopy.frame.size.height = 500
//    layoutAttributesCopy.frame.size.width = 500
//    print("preferredLayoutAttributesFitting")
//    return layoutAttributesCopy
//  }
}
// contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
