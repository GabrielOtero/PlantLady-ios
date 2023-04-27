//
//  HomeView.swift
//  PlantLady
//
//  Created by Gabriel Otero on 26/04/23.
//

import SwiftUI

struct HomeView: View {
    @State var goToPlantDetail: Bool = false
    @State var plantId: Int?
    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: PlantDetailView(plantId: plantId ?? 0).configureView(), isActive: $goToPlantDetail, label: {EmptyView()}
                )
                Text("Home").font(.title)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Popular Plants")
                    .padding([.top,.leading])
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(1..<11) { index in
                            Text("Plant \(index)")
                                .font(.headline)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .onTapGesture {
                                    self.plantId = index
                                    self.goToPlantDetail = true
                                }
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
