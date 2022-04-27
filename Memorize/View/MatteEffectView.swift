//
//  MatteEffectView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

//MARK: MatteEffectView

struct MatteEffectView: UIViewRepresentable {
    
    //MARK: Properties

    @Environment(\.colorScheme) private var colorScheme

    private var effect: UIVisualEffect {
        UIBlurEffect(style: colorScheme == .dark ? .systemUltraThinMaterialDark : .systemUltraThinMaterialLight)
    }

    //MARK: Public Methods

    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
    
}
