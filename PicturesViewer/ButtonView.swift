//
//  ButtonView.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 21/03/2022.
//

import SwiftUI

struct ButtonView: View {
    @State private var showPhotoSheet = false
    @Binding var images:  Array<UIImage>?

    var body: some View {
        VStack {
          Button(action: { showPhotoSheet = true }) {
            Label("Choose photo", systemImage: "photo.fill")
          }
          .fullScreenCover(isPresented: $showPhotoSheet) {
            PhotoPicker(filter: .images, limit: 10) { results in
              PhotoPicker.convertToUIImageArray(fromResults: results) { (imagesOrNil, errorOrNil) in
                if let error = errorOrNil {
                  print(error)
                }
                  if imagesOrNil != nil {
                      images = imagesOrNil
                  }
              }
            }
            .edgesIgnoringSafeArea(.all)
          }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    @State static var prev: Array<UIImage>? = []
    static var previews: some View {
        ButtonView(images : $prev)
    }
}
