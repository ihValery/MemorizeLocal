//
//  Cardify.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 8.05.21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    //MARK: - Properties

    private var rotation: Double
    
    private var isFaceUp: Bool {
        rotation < 90
    }

    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    //MARK: - Initializer

    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    //MARK: - Body

    ///.cardify — это “картафикатор” общего назначения, это ViewModifier, чтобы модифицировать любой View.
    func body(content: Content) -> some View {
        ZStack {
            //С помощью Group избавляемся от is-else
            Group {
                RoundedRectangle(cornerRadius: 13).fill(Color.white)
                RoundedRectangle(cornerRadius: 13).stroke(lineWidth: 3)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: 13).fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0, 1, 0))
    }
    
}

//MARK: - SomeProtocol

extension View {
    ///Модификатор, который делает “картой” любой View. Красивый синтаксис.
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
