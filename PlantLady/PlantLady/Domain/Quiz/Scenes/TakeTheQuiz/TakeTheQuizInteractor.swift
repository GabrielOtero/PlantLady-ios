import Foundation
import SwiftUI

protocol TakeTheQuizBusinessLogic {
    func getQuizQuestions(request: QuizModel.GetQuizQuestions.Request)
    func setSelectedAnswer(questionIndex: Int, answer: Int)
    func getQuizResult()
}

class TakeTheQuizInteractor {
    var presenter: TakeTheQuizPresentationLogic?

    var questionList : [QuizQuestion] =
    [
        QuizQuestion( id: 1,
          title : "Let’s begin! What kind of climate are you in?" ,
          options: ["Tropical", "Cold", "Dry", "Mild"]
        ),
        QuizQuestion( id: 2,
          title : "What are your gardening skills? Be honest, there's no judgment here." ,
          options: [ "I can't keep dirt alive",
                     "Somewhere close to good",
                     "I definitely have a green thumb"]
        ),
        QuizQuestion( id: 3,
          title : "What kind of light is there where you want to put your plant?" ,
          options: ["Direct sunlight",
                    "There's brightness but no direct sunlight",
                    "Only artificial lights or a little brightness from the sun"]
        ),
        QuizQuestion( id: 4,
          title : "What are you looking for in your plant?" ,
          options: ["Something colorful",
                    "Something with interesting leafs",
                    "I don’t really mind"]
        ),
        QuizQuestion( id: 5,
          title : "Are you thinking of a ground plant to put on a vase, or a hanging plant to stay high?" ,
          options: ["Ground plant", "Hanging plant"]
        ),
        QuizQuestion( id: 6,
          title : "Are you looking for just a pretty plant or something with a purpose?" ,
          options: ["It's more about aesthetics",
                    "Something for cooking or with medicinal properties"]
        ),
        QuizQuestion( id: 7,
          title : "This one is very important. Do you have a small kid or pet that might eat the plant?" ,
          options: ["Yes, that’s a risk", "Nope, it’s all good"]
        ),

    ]
}


extension TakeTheQuizInteractor: TakeTheQuizBusinessLogic {
    func getQuizQuestions(request: QuizModel.GetQuizQuestions.Request) {
        presenter?.presentQuizQuestions(questions: self.questionList)
    }

    func setSelectedAnswer(questionIndex: Int, answer: Int){
        if let index = questionList.firstIndex(where: { $0.id == questionIndex }) {
            questionList[index].answer = answer
        }
    }

    func getQuizResult() {
        print(self.questionList)
    }
}
