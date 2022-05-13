//
//  ContentView.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 21/03/2022.
//

import SwiftUI

struct ContentView: View {
    @Binding var images:  Array<UIImage>
    @State var imageIndex : Int = 0
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    let resetAction: ()->Void

    var body: some View {
        VStack{
            ListPicturesView(images: $images, imageIndex: $imageIndex)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
            VStack {
                    ButtonView(images: $images, imageIndex: $imageIndex) {
                        saveAction()
                    }
                    Button(action: resetList) {
                      Label("Clear list", systemImage: "clear.fill")
                    }.disabled(images.count == 0)
                    .tint(.blue)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 5))
                    .controlSize(.large)
                    ButtonShare(images: $images)
            }
        }.frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
    }
    
    func resetList() {
        resetAction()
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var prev: Array<UIImage> = []

    static var previews: some View {
        ContentView(images: $prev, saveAction: {}, resetAction: {})
    }
}
