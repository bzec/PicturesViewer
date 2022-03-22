//
//  ContentView.swift
//  PicturesViewer
//
//  Created by Bryan Zec on 21/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var images:  Array<UIImage>? = []

    var body: some View {
        HStack{
            VStack{
                ListPicturesView(images: $images)
                ButtonView(images: $images)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
