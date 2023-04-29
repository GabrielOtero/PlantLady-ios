import SwiftUI

protocol PlantDetailDisplayLogic {
    func displayPlantDetail(viewModel: PlantDetail.GetPlantDetail.ViewModel)
}

extension PlantDetailView: PlantDetailDisplayLogic {
    func displayPlantDetail(viewModel: PlantDetail.GetPlantDetail.ViewModel) {
        plantViewModel.name = viewModel.name
    }
    
    func fetchPlantDetail(plantId: Int){
        let request = PlantDetail.GetPlantDetail.Request(plantId: plantId)
        interactor?.getPlantDetail(request: request)
    }
    
    
}


struct PlantDetailView: View {
    var interactor: GetPlantDetailBusinessLogic?
    var plantId: Int
    
    @ObservedObject var plantViewModel = PlantDetail.GetPlantDetail.ViewModel()
    
    var body: some View {
        VStack {
            Text(plantViewModel.name)
        }.onAppear{
            fetchPlantDetail(plantId: plantId)
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plantId: 1)
    }
}
