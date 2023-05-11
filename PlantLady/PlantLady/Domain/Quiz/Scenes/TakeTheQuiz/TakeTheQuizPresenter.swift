import Foundation
import SwiftUI

protocol TakeTheQuizPresentationLogic {
    func presentQuizQuestions(questions: [QuizQuestion])
    func goToPlantResultList(response: QuizModel.QuizResult.Response)
}

class TakeTheQuizPresenter {
    var view: TakeTheQuizDisplayLogic?
}

extension TakeTheQuizPresenter: TakeTheQuizPresentationLogic {
    func presentQuizQuestions(questions: [QuizQuestion]){
        view?.presentQuizQuestions(questions: questions)
    }

    func goToPlantResultList(response: QuizModel.QuizResult.Response){
        view?.goToPlantResultList(plantResultList: response.resultList)
    }
}
