//
//  ContentView.swift
//  BuzzerBeater
//
//  Created by kevin marinho on 06/02/23.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
#endif
