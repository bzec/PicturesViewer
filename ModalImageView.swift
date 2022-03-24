//
//  ModalImageView.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 24/03/2022.
//

import SwiftUI

struct ModalImageView: View {
    @Environment(\.presentationMode) var presentationMode
    var image: UIImage
    var body: some View {
        Image(uiImage: image)
            .resizable().aspectRatio(contentMode: .fit)
            .scaleEffect(1)
        Text("Close Modal")
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct ModalImageView_Previews: PreviewProvider {
    static var img: UIImage = UIImage(named: "image")!
    static var previews: some View {
        ModalImageView(image: img)
    }
}
