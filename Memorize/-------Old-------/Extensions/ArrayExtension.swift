//
//  ArrayExtension.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 1.05.21.
//  

import Foundation

extension Array where Element: Identifiable {
    //Своя функция поиска индекса, для понимания как работает нативная
    ///Ищем индекс выбранного элемента в массиве, и как только нашли первый подходящий, то возвращаем его индекс.
    func firstChosenIndex(selected: Element) -> Int? {
        for index in self.indices {
            if self[index].id == selected.id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    ///Нужен только один первый элемент
    var onlyOne: Element? {
        count == 1 ? first : nil
    }
}
