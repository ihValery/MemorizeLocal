//
//  LineView.swift
//  CombineFirebase
//
//  Created by Валерий Игнатьев on 30.05.21.
//

import SwiftUI

//MARK: LineView

struct LineView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: GlobalConstant.cornerRadius)
            .frame(height: 2)
            .opacity(GlobalConstant.Opacity.strong)
    }
}
