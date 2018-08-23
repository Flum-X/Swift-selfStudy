//
//  LibraryAPI.swift
//  SwiftProject7
//
//  Created by DaXiong on 2018/8/22.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    static let shareInstance = LibraryAPI()
    let persistencyManager = PersistencyManager()
    
    fileprivate override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LibraryAPI.downloadImage(_:)), name: Notification.Name(rawValue: downloadImageNotification), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func getPokemons() -> [Pokemon] {
        return pokemons
    }
    
    func downloadImg(_ url: String) -> UIImage {
        let aUrl = URL(string: url)
        let data = try? Data(contentsOf: aUrl!)
        let image = UIImage(data: data!)
        return image!
    }
    
    func downloadImage(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: AnyObject]
        let pokeImageView = userInfo["pokeImageView"] as! UIImageView?
        let pokeImageUrl = userInfo["pokeImageUrl"] as! String
        
        if let imageViewUnWrapped = pokeImageView {
            imageViewUnWrapped.image = persistencyManager.getImage(URL(string: pokeImageUrl)!.lastPathComponent)
            if imageViewUnWrapped.image == nil {
                
                DispatchQueue.global().async {
                    let downloadedImage = self.downloadImg(pokeImageUrl as String)
                    DispatchQueue.main.async {
                        imageViewUnWrapped.image = downloadedImage
                        self.persistencyManager.saveImage(downloadedImage, fileName: URL(string: pokeImageUrl)!.lastPathComponent)
                    }
                }
            }
        }
    }
}
