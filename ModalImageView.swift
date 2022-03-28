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
    @GestureState var scale: CGFloat = 1.0

    var body: some View {
        Image(uiImage: image)
            .resizable().aspectRatio(contentMode: .fit)
            .scaleEffect(scale)
            .gesture(MagnificationGesture()
                .updating($scale, body: { (value, scale, trans) in
                    scale = value.magnitude
                })
            )
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
