//
//  DelegateMoviesCollectionView.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit
protocol DelegateMoviesCollectionViewProtocol {
    func movieSelected(index: Int)
}

class DelegateMoviesCollectionView: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var delegate: DelegateMoviesCollectionViewProtocol?

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.movieSelected(index: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = (UIScreen.main.bounds.width / 2) - 16
        let heightCell = UIScreen.main.bounds.height * 0.35
        return CGSize(width: widthCell, height: heightCell)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
