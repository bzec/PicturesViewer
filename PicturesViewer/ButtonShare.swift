//
//  ButtonShare.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 15/04/2022.
//

import SwiftUI

struct ButtonShare: View {
    @Binding var images:  Array<UIImage>
    @State var sheet = false
    var body: some View {
        VStack {
            Button(action: {
                sheet.toggle()
                
            }) {
            Label("Share photos", systemImage: "square.and.arrow.up")
          }
        }
        .sheet(isPresented: $sheet, content: {
            ShareSheetPictures(items: images)
        })
        .disabled(images.count == 0)
    }
}

struct ButtonShare_Previews: PreviewProvider {
    @State static var prev: Array<UIImage> = []

    static var previews: some View {
        ButtonShare(images : $prev)
    }
}
