//
//  ExploreView.swift
//  PlantLady
//
//  Created by Gabriel Otero on 26/04/23.
//

import SwiftUI

struct ExploreView: View {
    @State var goToQuiz: Bool = false

    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: TakeTheQuizView(rootIsActive: self.$goToQuiz).configureView(), isActive: $goToQuiz, label: {EmptyView()}
                )
                Text("Explore").font(.title)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("By Type")
                    .padding([.top,.leading])
                    .frame(maxWidth: .infinity, alignment: .leading)

                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(1..<5) { index in
                            Text("Type \(index)")
                                .font(.headline)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .onTapGesture {
//                                    self.plantId = index
//                                    self.goToPlantDetail = true
                                }
                        }
                    }
                    .padding()
                }
                Spacer()
                Text("By Room")
                    .padding([.top,.leading])
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(1..<5) { index in
                            Text("Room \(index)")
                                .font(.headline)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .onTapGesture {
//                                    self.plantId = index
//                                    self.goToPlantDetail = true
                                }
                        }
                    }
                    .padding()
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.green)
                    .padding()
                    .onTapGesture {
                        self.goToQuiz = true
                    }

                    Text("Take the Quiz")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
