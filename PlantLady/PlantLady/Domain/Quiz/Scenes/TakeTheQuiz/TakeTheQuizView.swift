import SwiftUI

protocol TakeTheQuizDisplayLogic {
    func presentQuizQuestions(questions: [QuizQuestion])
    func goToPlantResultList(plantResultList: [Plant])
}

extension TakeTheQuizView : TakeTheQuizDisplayLogic {
    func goToPlantResultList(plantResultList: [Plant]){
        viewModel.plantResultList = plantResultList
        viewModel.goToPlantResultList  = true
    }

    func presentQuizQuestions(questions: [QuizQuestion]){
        viewModel.questions = questions
    }

    func fetchQuizQuestions(){
        let request = QuizModel.GetQuizQuestions.Request()
        interactor?.getQuizQuestions(request: request)
    }

    func setSelectedAnswer(questionId: Int, answer: Int){
        interactor?.setSelectedAnswer(questionId: questionId, answer: answer)
    }

    func getQuizResult(){
        interactor?.getQuizResult()
    }
}

struct TakeTheQuizView: View {
    @Environment(\.presentationMode) var presentationMode

    var interactor: TakeTheQuizBusinessLogic?

    @Binding var rootIsActive : Bool
    @State private var tabSelection = 0

    @ObservedObject var viewModel = QuizModel.GetQuizQuestions.ViewModel()
    
    var body: some View {
        VStack {
            NavigationLink(destination: PlantResultListView(plantResultList: viewModel.plantResultList, shouldPopToRootView: self.$rootIsActive).configureView(), isActive: $viewModel.goToPlantResultList, label: {EmptyView()}
            ).isDetailLink(false)
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
                                        setSelectedAnswer(questionId: question.id, answer: optionIndex + 1)
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
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                    if(self.tabSelection == 0){
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        withAnimation{
                            self.tabSelection -= 1
                        }
                    }
                }) {
                    Image(systemName: "arrow.left")
                }
            )
        }
    }
}
