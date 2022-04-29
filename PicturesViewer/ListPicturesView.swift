//
//  ListPicturesView.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 21/03/2022.
//

import SwiftUI

struct ListPicturesView: View {
    @Binding var images : Array<UIImage>
    @Binding var imageIndex : Int

    @State var isFullScreen : Bool = false;
    var body: some View {
        if images.count > 0 {
            HStack {
                Button(action: minusOne){
                    Image(systemName: "chevron.compact.left")
                        .padding()
                }
                Spacer()

                Image(uiImage: images[imageIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .fullScreenCover(isPresented: $isFullScreen){
                        ModalImageView(image : images[imageIndex])
                            
                    }
                    .onTapGesture {
                        isFullScreen = true
                        print(isFullScreen)
                        
                    }
                Spacer()

                Button(action: plusOne){
                    Image(systemName: "chevron.compact.right")
                        .frame(width: 20, height: 20)
                        .padding()
                }
            }
        }
    }

    func minusOne() {
        if(imageIndex > 0) {
            imageIndex-=1
        }
    }
    
    func plusOne() {
        if(imageIndex < images.count - 1) {
            imageIndex+=1
        }
    }
}

struct ListPicturesView_Previews: PreviewProvider {
    @State static var prev: Array<UIImage> = []
    @State static var index = 0
    
    static var previews: some View {
        ListPicturesView(images : $prev, imageIndex: $index)
    }
}
