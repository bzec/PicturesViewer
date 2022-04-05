//
//  ImagesDefault.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 30/03/2022.
//

import Foundation
import SwiftUI

class ImagesDefault {
    private static var defaults = UserDefaults.standard

    static func load() -> Array<UIImage> {
        var list : Array<UIImage> = []
        if let savedImg = defaults.object(forKey: "SavedImage") as? Data {
            let decoder = JSONDecoder()
            if let loadedImgs = try? decoder.decode([Data].self, from: savedImg) {
                var listImages : Array<UIImage> = []
                loadedImgs.forEach { im in
                    listImages.append(UIImage(data: im)!)
                }
                list = listImages
            }
        }
        return list

    }
    
    static func save(images: Array<UIImage>) {
       
        var imagesEncode: [Data] = []
        images.forEach { image in
            let imageData: Data = image.pngData()!
            // let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
            imagesEncode.append(imageData)
        }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(imagesEncode) {
            defaults.set(encoded, forKey: "SavedImage")
        }
    }
}
