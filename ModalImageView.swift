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

        ZStack {
            ZoomableScrollView {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                    Image(systemName: "arrow.down")
                    .frame(width: 35, height: 35)
        
                    }
                    .tint(.blue)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 25))

                    Spacer()
                }.padding()
          }
        }
    }

}

struct ModalImageView_Previews: PreviewProvider {
    static var img: UIImage = UIImage(named: "image")!
    static var previews: some View {
        ModalImageView(image: img)
    }
}
