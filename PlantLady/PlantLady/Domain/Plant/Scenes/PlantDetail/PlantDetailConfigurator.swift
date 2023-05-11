import SwiftUI
import Foundation

extension PlantDetailView {
  func configureView() -> some View {
    var view = self
    let interactor = PlantDetailInteractor()
    let presenter = PlantDetailPresenter()
    
    view.interactor = interactor
    interactor.presenter = presenter
    presenter.view = view

    return view
  }
}
