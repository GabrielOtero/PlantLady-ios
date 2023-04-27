import Foundation

enum PlantDetail {
  enum GetPlantDetail {
    struct Request {
      var plantId: Int
    }

    struct Response {
      var plantData: Plant
    }

      class ViewModel : ObservableObject{
          @Published var id: Int = 0
          @Published var  name: String = ""
    }
  }
}
