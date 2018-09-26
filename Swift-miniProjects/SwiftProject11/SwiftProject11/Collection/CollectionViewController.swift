//
//  CollectionViewController.swift
//  Swift11
//
//  Created by DaXiong on 2018/9/20.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    fileprivate let reuseIdentifier = "PhotoCell"
    fileprivate let thumbnailSize:CGFloat = 70.0
    fileprivate let sectionInsets = UIEdgeInsets(top: 10, left: 5.0, bottom: 10.0, right: 5.0)
    fileprivate let photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
            let indexpath = collectionView?.indexPath(for: cell),
            let zoomedPhotoViewController = segue.destination as? ZoomedPhotoViewController{
            zoomedPhotoViewController.photoName = "photo\(indexpath.row + 1)"
        }
        
        if let cell = sender as? UICollectionViewCell,
            let indexPath = collectionView?.indexPath(for: cell),
            let photoCommentViewController = segue.destination as? PhotoCommentViewController {
            photoCommentViewController.photoName = "photo\(indexPath.row + 1)"
        }
        
        if let cell = sender as? UICollectionViewCell,
            let indexPath = collectionView?.indexPath(for: cell),
            let managePageViewController = segue.destination as? ManagePageViewController {
            managePageViewController.photos = photos
            managePageViewController.currentIndex = indexPath.row
        }
    }
}
    // MARK: UICollectionViewDataSource
extension CollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        let fullSizedImage = UIImage(named:photos[indexPath.row])
        cell.imageView.image = fullSizedImage?.thumbnailOfSize(thumbnailSize)
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: thumbnailSize, height: thumbnailSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}





