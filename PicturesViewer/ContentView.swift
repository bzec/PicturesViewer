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

    var body: some View {
        HStack{
            VStack{
                ListPicturesView(images: $images, imageIndex: $imageIndex)
                ButtonView(images: $images, imageIndex: $imageIndex) {
                    saveAction()
                }
            }
        }
        /*
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var prev: Array<UIImage> = []

    static var previews: some View {
        ContentView(images: $prev, saveAction: {})
    }
}
