//
//  TwoBackgroundCardView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

//MARK: TwoBackgroundCardView

struct TwoBackgroundCardView: View {
    
    //MARK: Properties
    
    var showMenu: Bool
    
    private let paddingVertical: CGFloat = 30
    private let blurDegree: CGFloat = 1
    private var cornerRadius: CGFloat {
        showMenu ? GlobalConstant.cornerRadius : 0
    }
    private var coefficient: CGFloat {
        (isWithBangs ? -25 : -20)
    }
    private var horizontalOffset: CGFloat {
        showMenu ? coefficient : 0
    }
    
    //MARK: Initializer
    
    init(_ showMenu: Bool) {
        self.showMenu = showMenu
    }

    var body: some View {
        Color.defaultElement
            .opacity(GlobalConstant.Opacity.strong)
            .cornerRadius(cornerRadius)
            .shadow(color: .defaultText.opacity(GlobalConstant.Opacity.weak),
                    radius: 5, x: -5, y: 0)
            .offset(x: horizontalOffset)
            .padding(.vertical, paddingVertical)
            .blur(radius: blurDegree)
        
        Color.defaultElement
            .opacity(GlobalConstant.Opacity.meddle)
            .cornerRadius(cornerRadius)
            .offset(x: horizontalOffset * 2)
            .padding(.vertical, paddingVertical * 2)
            .blur(radius: blurDegree * 2)
    }
    
}
