protocol PlantDetailPresentationLogic {
    func presentPlantDetail(response: PlantDetail.GetPlantDetail.Response)
}

class PlantDetailPresenter {
    var view: PlantDetailDisplayLogic?
}

extension PlantDetailPresenter : PlantDetailPresentationLogic {
    func presentPlantDetail(response: PlantDetail.GetPlantDetail.Response) {
        let viewModel = PlantDetail.GetPlantDetail.ViewModel()
        viewModel.id = response.plantData.id
        viewModel.name = response.plantData.name
        view?.displayPlantDetail(viewModel: viewModel)
    }
    
    
}
