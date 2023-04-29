import SwiftUI

protocol TakeTheQuizDisplayLogic {
   
}

extension TakeTheQuizView : TakeTheQuizDisplayLogic {
    
}

struct TakeTheQuizView: View {
    var interactor: TakeTheQuizBusinessLogic?
    
    @State private var tabSelection = 0
    
    private let colors : [Color] = [.red, .blue, .green, .orange, .black]
    
    var body: some View {
        VStack {
            TabView(selection: $tabSelection) {
                ForEach(Array(colors.enumerated()), id: \.offset){ index, color in
                    ZStack {
                        color
                        Text("\(color.description)").font(.title)
                            .foregroundColor(.white)
                            .onTapGesture {
                                withAnimation{
                                    self.tabSelection = index + 1
                                }
                            }
                    }.highPriorityGesture(DragGesture())
                }
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
