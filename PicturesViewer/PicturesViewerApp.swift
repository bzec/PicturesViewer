//
//  PicturesViewerApp.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 21/03/2022.
//

import SwiftUI

@main
struct PicturesViewerApp: App {
    @StateObject private var store = ImageStore()

    // https://www.youtube.com/watch?v=WZOvroeUuxI&ab_channel=Kavsoft
    var body: some Scene {
        WindowGroup {
            ContentView(images: $store.images, saveAction: {
                ImageStore.save(images: store.images) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                    if case .success(_) = result {
                        print(result)
                    }
                }
                
            }, resetAction: {
                ImageStore.delete() { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                    if case .success(_) = result {
                        print(result)
                        store.images = []
                    }
                }
            })
            .onAppear {
                    ImageStore.load { result in
                        switch result {
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        case .success(let imgs):
                            store.images = imgs
                        }
                    }
                }
        }
    }
}
