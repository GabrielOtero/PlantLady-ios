import Foundation
import Alamofire

protocol GetPlantDetailBusinessLogic {
  func getPlantDetail(request: PlantDetail.GetPlantDetail.Request)
}

class PlantDetailInteractor {
  var presenter: PlantDetailPresentationLogic?
}

extension PlantDetailInteractor: GetPlantDetailBusinessLogic {
    func getPlantDetail(request: PlantDetail.GetPlantDetail.Request) {
        print("getPlantDetail")
        AF.request("https://yardman-prod.glitch.me/plant/" + String(request.plantId)).responseDecodable(of: Plant.self) { response in
            guard let plantData = response.value else { return }
            
            self.presenter?.presentPlantDetail(response:PlantDetail.GetPlantDetail.Response(plantData: plantData))
        }
        
        
//        { response in debugPrint(response)
//
//            self.presenter?.presentPlantDetail(response:PlantDetail.GetPlantDetail.Response(plantData: Plant(id: 1, name: "test")))
//        }
    }
}
