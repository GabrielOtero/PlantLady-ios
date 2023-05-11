import Foundation
import SwiftUI

enum QuizModel {
    enum QuizResult {
        struct Request {

        }

        struct Response {
          var resultList: [Plant]
        }
    }
    enum GetQuizQuestions {
        struct Request {

        }

        struct Response {
          var quizData: Quiz
        }

        class ViewModel : ObservableObject {
            @Published var questions: [QuizQuestion] = []
            @Published var goToPlantResultList: Bool = false
            @Published var plantResultList: [Plant] = []
        }
    }
}
