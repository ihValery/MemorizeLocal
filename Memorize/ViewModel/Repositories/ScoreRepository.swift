//
//  ScoreRepository.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 28.06.21.
//


/*

import Combine
import FirebaseFirestore
//FirebaseFirestoreSwift добавляет несколько интересных функций, которые помогут вам интегрировать Firestore с вашими моделями.
//Он позволяет конвертировать Score в документы и документы в Score.
import FirebaseFirestoreSwift

final class ScoreRepository: ObservableObject {
    
    //MARK: - Properties
    
    @Published var scores: [Score] = []
    
    private var userId = "noUser"
    private var sessionFirebase = SessionFirebase()
    private var cancellabel: Set<AnyCancellable> = []
    
    //MARK: - Initializer
    
    init() {
        //Привязать userid от sessionFirebase к репозиторию userId.
        //Он также сохраняет объект, cancellablesчтобы его можно было отменить позже.
        sessionFirebase.$user
            .compactMap { $0?.uid }
            .assign(to: \.userId, on: self)
            .store(in: &cancellabel)
        
        //Этот код наблюдает за изменениями user, использует receive(on:options:) для установки потока, в котором будет выполняться код,
        //а затем присоединяет подписчика с помощью sink(receiveValue:).
        //Это гарантирует, что когда вы получите user для sessionFirebase, код в замыкании будет выполняться в основном потоке.
        sessionFirebase.$user
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.get()
            }
            .store(in: &cancellabel)
    }
    
    //MARK: - Public Methods
    
    func add(_ score: Score) {
        do {
            var newScore = score
            //Создавая новую карточку, она будет содержать фактический идентификатор пользователя, сгенерированный Firebase.
            newScore.userId = userId
            _ = try createStore(userId: userId).addDocument(from: newScore)
        } catch {
            fatalError("Невозможно добавить карту: \(error.localizedDescription)")
        }
    }
    
    func update(_ score: Score) {
        guard let scoreId = score.id else { return }
        
        do {
            try createStore(userId: userId).document(scoreId).setData(from: score)
        } catch {
            fatalError("Невозможно обновить карту: \(error.localizedDescription)")
        }
    }
    
    func remove(_ score: Score) {
        guard let scoreId = score.id else { return }
        
        createStore(userId: userId).document(scoreId).delete() { error in
            if let error = error {
                fatalError("Невозможно удалить карту: \(error.localizedDescription)")
            }
        }
    }
    
    //MARK: - Private Methods
    
    private func get() {
        createStore(userId: userId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Ошибка при получении карточек: \(error.localizedDescription)")
                    return
                }
                self.scores = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Score.self)
                } ?? []
            }
    }
    
    private func createStore(userId: String) -> CollectionReference {
        return Firestore.firestore().collection("users").document(userId).collection("score")
    }
    
}
*/
