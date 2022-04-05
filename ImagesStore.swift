//
//  ImagesStore.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 30/03/2022.
//

import Foundation
import SwiftUI

class ImageStore: ObservableObject {
    @Published var images: Array<UIImage> = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("images.data")
    }
    
    static func load(completion: @escaping (Result<Array<UIImage>, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                
                let listImagesData = try JSONDecoder().decode(Array<Data>.self, from: file.availableData)

                DispatchQueue.main.async {
                    
                    var listImages : Array<UIImage> = []
                    listImagesData.forEach { im in
                        listImages.append(UIImage(data: im)!)
                    }
                    completion(.success(listImages))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(images: Array<UIImage>, completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                print("on encode les images")

                var imagesEncode: [Data] = []
                images.forEach { image in
                    let imageData: Data = image.pngData()!
                    imagesEncode.append(imageData)
                }
                let data = try JSONEncoder().encode(imagesEncode)
                print("on get le outfile")
                let outfile = try fileURL()
                try data.write(to: outfile)
                print("write")
                DispatchQueue.main.async {
                    print("finish")

                    completion(.success(imagesEncode.count))
                }
            } catch {
                print("ERROR")

                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
