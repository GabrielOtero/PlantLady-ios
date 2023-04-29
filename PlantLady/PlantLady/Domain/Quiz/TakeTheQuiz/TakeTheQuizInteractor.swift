import Foundation


protocol TakeTheQuizBusinessLogic {
    
}

class TakeTheQuizInteractor {
  var presenter: TakeTheQuizPresentationLogic?
}


extension TakeTheQuizInteractor: TakeTheQuizBusinessLogic {
}
