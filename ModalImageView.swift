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
    
    @State var scale = 1.0
    @State private var lastScale = 1.0

    private let minScale = 1.0
    private let maxScale = 5.0
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
              .aspectRatio(contentMode: .fit)
              .scaleEffect(scale)
              .gesture(MagnificationGesture()
                .onChanged { state in
                    adjustScale(from: state)
                }
                .onEnded { state in
                    withAnimation {
                        validateScaleLimits()
                    }
                    lastScale = 1.0
                    
                }
         )
        Text("Close Modal")
            .onTapGesture {
                // change scale value to fix animation image bug when we dismiss value
                scale = minScale
                presentationMode.wrappedValue.dismiss()
            }
    }

    func adjustScale(from state: MagnificationGesture.Value) {
        let delta = state / lastScale
        scale *= delta
        lastScale = state
    }
    
    func getMinimumScaleAllowed() -> CGFloat {
        return max(scale, minScale)
    }
    
    func getMaximumScaleAllowed() -> CGFloat {
        return min(scale, maxScale)
    }
    
    func validateScaleLimits() {
        scale = getMinimumScaleAllowed()
        scale = getMaximumScaleAllowed()
    }
}

struct ModalImageView_Previews: PreviewProvider {
    static var img: UIImage = UIImage(named: "image")!
    static var previews: some View {
        ModalImageView(image: img)
    }
}
