import SwiftUI

struct PlantResultListView: View {

    var plantResultList: [Plant]

    @Binding var shouldPopToRootView : Bool
    @State var goToPlantDetail: Bool = false
    @State var plantId: Int?

    var body: some View {
        VStack{
            NavigationLink(destination: PlantDetailView(plantId: plantId ?? 0).configureView(), isActive: $goToPlantDetail, label: {EmptyView()}
            )
            List(plantResultList, id: \.id) { plant in
                Text(plant.name).onTapGesture {
                    self.plantId = plant.id
                    self.goToPlantDetail = true
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action:  { self.shouldPopToRootView = false }) {
                Image(systemName: "arrow.left")
            }
        )
    }
}
