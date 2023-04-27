//
//  ContentView.swift
//  PlantLady
//
//  Created by Gabriel Otero on 26/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            HomeView().tabItem {
                Label(
                    title: {Text("Home") },
                    icon: { Image(systemName: "house")}
                )
            }.tag(1)
            
            ExploreView().tabItem {
                Label(
                    title: {Text("Explore") },
                    icon: { Image(systemName: "leaf")}
                )
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
