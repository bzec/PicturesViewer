//
//  ListPicturesView.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 21/03/2022.
//

import SwiftUI

struct ListPicturesView: View {
    @Binding var images : Array<UIImage>!
    @State var imageIndex : Int = 0

    var body: some View {
        if images.count > 0 {
            HStack {
                Button(action: {
                    print("record clicked")
                    if(imageIndex > 0) {
                        print("ron remove")

                        imageIndex-=1
                    }
                }){
                    Image(systemName: "chevron.compact.left")
                    Text("")
                        .padding()
                }

                Image(uiImage: images[imageIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 200)
               
                Button(action: {
                    print("record clicked")
                    if(imageIndex < images.count - 1) {
                        print("ron addd")

                        imageIndex+=1
                    }
                }){
                    Image(systemName: "chevron.compact.right")
                    Text("")
                        .padding()
                }
            }
        }
    }
}

struct ListPicturesView_Previews: PreviewProvider {
    @State static var prev: Array<UIImage>? = []

    static var previews: some View {
        ListPicturesView(images : $prev)
    }
}
