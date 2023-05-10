import Foundation
import SwiftUI

protocol TakeTheQuizPresentationLogic {
    func presentQuizQuestions(questions: [QuizQuestion])
}

class TakeTheQuizPresenter {
    var view: TakeTheQuizDisplayLogic?
}

extension TakeTheQuizPresenter :TakeTheQuizPresentationLogic {
    func presentQuizQuestions(questions: [QuizQuestion]){
        view?.presentQuizQuestions(questions: questions)
    }
}
