//
//  ScoreViewModel.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 28.06.21.
//

import Foundation
import Combine

//MARK: - ScoreViewModel

final class ScoreViewModel: ObservableObject {
    
    //MARK: Properties
    
    @Published var scoreSheet: ScoreModel
    
//    var id = ""
    
//    private let repository = ScoreRepository()
//    private var cancellabel: Set<AnyCancellable> = []
    
    //MARK: Initializer
    
    init() {
        self.scoreSheet = ScoreModel("🧚", maxScore: 0)
//        self.score = score
        //Настройте привязку score между карточкой id и моделью представления id.
        //Затем сохраните объект cancellables чтобы его можно было отменить позже.
//        $score
//            .compactMap { $0.id }
        //Результат этого преобразования затем используется  подписчиком  assign, который — как следует из названия — назначает полученное значение
//            .assign(to: \.id, on: self)
//            .store(in: &cancellabel)
    }
    
    //MARK: Public Methods
    
    func remove() {
//        repository.remove(score)
    }
    
    func dateToString(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd/MM/y  HH:mm"
        return timeFormatter.string(from: date)
    }
    
    func dateToString() -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd/MM/y  HH:mm"
        return timeFormatter.string(from: scoreSheet.date)
    }
    
    //MARK: Private Methods
    
    private func getScoreData() {
        
    }
}
