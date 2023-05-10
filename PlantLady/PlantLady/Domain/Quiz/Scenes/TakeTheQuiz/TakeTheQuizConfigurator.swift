import SwiftUI
import Foundation

extension TakeTheQuizView {
  func configureView() -> some View {
    var view = self
    let interactor = TakeTheQuizInteractor()
    let presenter = TakeTheQuizPresenter()
    
    view.interactor = interactor
    interactor.presenter = presenter
    presenter.view = view

    return view
  }
}
