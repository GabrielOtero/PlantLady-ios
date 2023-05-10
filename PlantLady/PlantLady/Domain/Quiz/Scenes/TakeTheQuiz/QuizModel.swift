import Foundation
import SwiftUI

enum QuizModel {
  enum GetQuizQuestions {
    struct Request {

    }

    struct Response {
      var quizData: Quiz
    }

    class ViewModel : ObservableObject {
        @Published var questions: [QuizQuestion] = []
    }
  }
}
