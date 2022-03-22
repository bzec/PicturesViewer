//
//  ListPicturesView.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 21/03/2022.
//

import SwiftUI

struct ListPicturesView: View {
    @Binding var images :  Array<UIImage>?
    var body: some View {
        if images != nil {
            ForEach(images!, id: \.self) { image in
                Image(uiImage: image)
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(maxWidth: 200, maxHeight: 200)
            }
        }
    }
}

struct ListPicturesView_Previews: PreviewProvider {    @State static var prev: Array<UIImage>? = []

    static var previews: some View {
        ListPicturesView(images : $prev)
    }
}
