//
//  ShareSheetPictures.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 15/04/2022.
//
import Foundation
import SwiftUI
struct ShareSheetPictures : UIViewControllerRepresentable {
    
    var items : [UIImage]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController , context: Context) {
        
    }
}
