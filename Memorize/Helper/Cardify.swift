//
//  Cardify.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 8.05.21.
//

import SwiftUI

//Прекрасная повторно используемая (reusable) вещь, которую мы могли бы использовать в другой игре.
//Что бы использовать animatableData (ViewModifier и Animatable) нужно установить AnimatableModifier
//”Я хочу быть модификатором ViewModifier, который хочет принимать участие в анимационной системе”
struct Cardify: AnimatableModifier {
    
    var rotation: Double
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    //Переменная var animatableData находится в протоколе Animatable
    //Не хотим использовать имя “animatableData” в нашем коде(надо более осмысленное).
    //Очень часто get/set просто получают/устанавливают некоторые другие vars.
    //(по существу, представляя их системе анимации под другими именами)
    //подписываются на получение промежуточных значений AnimatableData.
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }

    ///.cardify — это “картафикатор” общего назначения, это ViewModifier, чтобы модифицировать любой View.
    func body(content: Content) -> some View {
        ZStack {
            //С помощью Group избавляемся от is-else
//            if isFaceUp {
            Group {
                RoundedRectangle(cornerRadius: 13).fill(Color.white)
                RoundedRectangle(cornerRadius: 13).stroke(lineWidth: 3)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: 13).fill()//.opacity(0.3)
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0, 1, 0))
    }
}

extension View {
    ///Модификатор, который делает “картой” любой View. Красивый синтаксис.
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
