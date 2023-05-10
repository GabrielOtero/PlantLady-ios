import SwiftUI

protocol TakeTheQuizDisplayLogic {
    func presentQuizQuestions(questions: [QuizQuestion])
}

extension TakeTheQuizView : TakeTheQuizDisplayLogic {
    func presentQuizQuestions(questions: [QuizQuestion]){
        viewModel.questions = questions
    }

    func fetchQuizQuestions(){
        let request = QuizModel.GetQuizQuestions.Request()
        interactor?.getQuizQuestions(request: request)
    }

    func setSelectedAnswer(questionIndex: Int, answer: Int){
        interactor?.setSelectedAnswer(questionIndex: questionIndex, answer: answer)
    }

    func getQuizResult(){
        interactor?.getQuizResult()
    }
}

struct TakeTheQuizView: View {
    var interactor: TakeTheQuizBusinessLogic?
    
    @State private var tabSelection = 0
    
    @ObservedObject var viewModel = QuizModel.GetQuizQuestions.ViewModel()
    
    var body: some View {
        VStack {
            TabView(selection: $tabSelection) {
                ForEach(Array(viewModel.questions.enumerated()), id: \.offset){ questionIndex, question in
                    ZStack {
                        VStack {
                            Text("\(question.title)").font(.title)
                            Spacer()
                            ForEach(Array(question.options.enumerated()), id: \.offset){ optionIndex, option in
                                Text("\(option)")
                                .font(.title3)
                                .onTapGesture {
                                    setSelectedAnswer(questionIndex: questionIndex, answer: optionIndex)
                                    withAnimation{
                                        if(questionIndex == viewModel.questions.count - 1){
                                            getQuizResult()
                                        }
                                        else {
                                            self.tabSelection = questionIndex + 1
                                        }
                                    }
                                }
                                Spacer()
                            }
                            Spacer()
                            Spacer()
                        }
                    }
                    .highPriorityGesture(DragGesture())

                }
            }
            .onAppear{
                fetchQuizQuestions()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct TakeTheQuizView_Previews: PreviewProvider {
    static var previews: some View {
        TakeTheQuizView()
    }
}
