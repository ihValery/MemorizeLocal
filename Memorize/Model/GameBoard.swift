//
//  File.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.04.21.
//

import Foundation

struct GameBoard <CardContent> where CardContent: Equatable {
    
    //MARK: - Properties
    
    private (set) var cards: [Card]
    private (set) var score: Int = 0
    
    private var sawThisCard: [Int] = []
    
    private var indexOnlyOneFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.onlyOne
        }
        set {
            for index in cards.indices {
                //Переворачиваем все карти лицом вниз кроме одной с индексом newValue
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    //MARK: - Initializer
    
    init(numbersOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for indexPairs in 0..<numbersOfPairsOfCards {
            let content = cardContentFactory(indexPairs)
            cards.append(Card(id: indexPairs * 2, content: content))
            cards.append(Card(id: indexPairs * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    //MARK: - Public Methods
    
    ///Функционал когда мы выбираем карточку. Вся наша логика по совпадениею карт.
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstChosenIndex(selected: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched else { return }
        
        if let potentialMatchIndex = indexOnlyOneFaceUpCard {
            
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                score += (themeData[ThemeViewModel.shared.current].timer == 0 ? 2 : Int(card.bonusTimeRemaining))
            } else {
                scoring(chosenIndex, potentialMatchIndex)
            }
            cards[chosenIndex].isFaceUp = true
        } else {
            indexOnlyOneFaceUpCard = chosenIndex
        }
    }
    
    //MARK: - Private Methods
    
    ///Формирование счета в игре: -1 очко за каждое несовпадение ранее увиденной карты.
    mutating private func scoring(_ chosenIndex: Int, _ potentialMatchIndex: Int) {
        sawThisCard.contains(cards[chosenIndex].id) ? score -= 1 : sawThisCard.append(cards[chosenIndex].id)
        sawThisCard.contains(cards[potentialMatchIndex].id) ? score -= 1 :  sawThisCard.append(cards[potentialMatchIndex].id)
    }
    
    //MARK: - SomeStruct
    
    //Предсталяет единственную карту
    struct Card: Identifiable {
        
        //MARK: - Properties
        
        var id: Int

        var isFaceUp: Bool = false {
            didSet {
                isFaceUp ? startUsingBonusTime() : stopUsingBonusTime()
            }
        }
        
        var isMatched: Bool = false {
            didSet {
                stopUsingBonusTime()
            }
        }

        var content: CardContent
        
        //MARK: - Bonus Time
        
        //может дать соответствующие бонусные баллы
        //если карта пользователя совпала
        //до того, как пройдет определенное время, в течение которого карта будет открыта
        //может быть нулевым, что означает "без бонусных баллов" для этой карты
        var bonusTimeLimit: TimeInterval = 6
        
        //последний раз карта была перевернута лицом вверх (и все еще остается лицевом вверх)
        var lastFaceUpDate: Date?
        
        //накопленное время, когда эта карта была открыта в прошлом
        //(то есть без учета текущего времени, когда он был открыт, это в настоящее время так)
        var pastFaceUpTime: TimeInterval = 0
        
        ///“Сколько времени осталось?”
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - pastFaceUpTime)
        }
        
        ///“Какой процент времени остался?”
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining / bonusTimeLimit : 0
        }
        
        ///в данный момент лицом вверх, не имеем себе равных и еще не использовали бонусное окно
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        ///"заслужили ли мы бонусы?"
        private var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        //MARK: - Private Methods

        //Как долго карта была isFaceUp
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        
        ///вызывается, когда карта переходит в открытое состояние
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        ///вызывается, когда карта возвращается лицом вниз (или совпадает)
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            lastFaceUpDate = nil
        }
    }
    
}
