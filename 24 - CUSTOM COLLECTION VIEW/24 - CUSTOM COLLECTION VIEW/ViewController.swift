//
//  ViewController.swift
//  24 - CUSTOM COLLECTION VIEW
//
//  Created by heshaoyi on 4/4/16.
//  Copyright © 2016 heshaoyi. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var phResult: PHFetchResult?
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let opt = PHFetchOptions()
//        let desc = NSSortDescriptor(key: "startDate", ascending: true)
//        opt.sortDescriptors = [desc]
        self.phResult = PHAsset.fetchAssetsWithOptions(opt)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return (self.phResult?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
       let cell = collectionView.dequeueReusableCellWithReuseIdentifier("image", forIndexPath: indexPath) as! ImageCollectionViewCell
       let asset =  phResult?.objectAtIndex(indexPath.row) as! PHAsset
        PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: cell.frame.size, contentMode: .AspectFill, options: nil, resultHandler: {
            (im:UIImage?, info:[NSObject : AnyObject]?) in
            if let im = im {
                cell.imageView.image = im
            }
        })
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let width = view.frame.size.width  / 3
        return CGSize(width: width, height: 100)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator){
        collectionView.collectionViewLayout.invalidateLayout()
    }

}

