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
    @State var currentOffset = CGSize.zero
    @State var previousOffset = CGSize.zero

    var body: some View {
        
        GeometryReader { geometry in // here you'll have size and frame
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale)
                .offset(x: self.currentOffset.width, y: self.currentOffset.height)
                .gesture(DragGesture()
                    .onChanged { value in
                        
                        let deltaX = value.translation.width - self.previousOffset.width
                        let deltaY = value.translation.height - self.previousOffset.height
                        self.previousOffset.width = value.translation.width
                        self.previousOffset.height = value.translation.height
                        
                        let newOffsetWidth = self.currentOffset.width + deltaX / self.scale
                        if newOffsetWidth <= geometry.size.width - 150.0 && newOffsetWidth > -150.0 {
                            self.currentOffset.width = self.currentOffset.width + deltaX / self.scale
                        }
                        
                        let newOffsetHeight = self.currentOffset.height + deltaY / self.scale
                        if newOffsetHeight <= geometry.size.height - 180.0 && newOffsetHeight > -180.0 {
                            self.currentOffset.height = self.currentOffset.height + deltaY / self.scale }
                    }
                    .onEnded { value in self.previousOffset = CGSize.zero })
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
        }
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
