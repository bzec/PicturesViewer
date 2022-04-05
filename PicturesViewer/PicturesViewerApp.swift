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

    var body: some Scene {
        WindowGroup {
            ContentView(images: $store.images){
                ImageStore.save(images: store.images) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
                
            }
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
