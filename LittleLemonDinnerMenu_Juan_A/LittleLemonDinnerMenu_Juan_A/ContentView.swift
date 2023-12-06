//
//  ContentView.swift
//  LittleLemonDinnerMenu_Juan_A
//
//  Created by Juan Alvarez on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView(){
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, World!")
                }
            }

        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
