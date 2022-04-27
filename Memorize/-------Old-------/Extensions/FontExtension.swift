//
//  FontExtension.swift.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 31.12.2021.
//

import SwiftUI

extension Font {
    static var sizeEmojiTheme: Font {
        Font.system(size: UIScreen.main.bounds.width / 2.5)
    }
    
    ///Размер Эмодзи зависящий от ширины или высоты ячеки помноженное на коэффициент
    static func sizeEmoji(for size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * 0.7)
    }
}
