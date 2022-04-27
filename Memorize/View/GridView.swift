//
//  Grid.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 1.05.21.
//

import SwiftUI

//“Немного важно, какой” ТИП Item. Мы все таки беспокоимся о том, какой ТИП имеет Item, а именно о том, чтобы он был Identifiable.
//Связываем generic с протоколами
//              ____Generic____             _____Protocol_____  ___Protocol___

//MARK: GridView

struct GridView<Item, ItemView>: View where Item: Identifiable, ItemView: View {

    //MARK: Properties

    private var items: [Item]
    private var viewForItem: (Item) -> ItemView

    //MARK: Initializer

    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }

    var body: some View {
        //1. geometry - получаем пространство, которое нам предлагается.
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }

    //MARK: Private Methods

    //2. используем GridLayout, чтобы поделить его, а затем предлагаем эти кусочки нашим маленьким sub-Views.
    private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            body(for: item, in: layout)
        }
    }

    private func body(for item: Item, in layout: GridLayout) -> some View {
        //Наш index никогда не будет равен nil (item всегда является элементом items изначально items)
        let index = items.firstChosenIndex(selected: item)!
        return viewForItem(item)
        //3. позиционируем их туда, куда скажет location в  GridLayout
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }

}

//MARK: GridLayout

struct GridLayout {

    //MARK: Properties

    private (set) var size: CGSize
    private (set) var rowCount: Int = 0
    private (set) var columnCount: Int = 0

    //какой размер будет иметь каждый из этих элементов, все они будут одного и того же размера
    var itemSize: CGSize {
        if rowCount == 0 || columnCount == 0 {
            return CGSize.zero
        } else {
            return CGSize(width: size.width / CGFloat(columnCount), height: size.height / CGFloat(rowCount))
        }
    }

    //MARK: Initializer

    init(itemCount: Int, nearAspectRatio desiredAspectRatio: Double = 1, in size: CGSize) {
        self.size = size
        //если наш размер равен нулю ширины или высоты или itemCount не > 0
        //тогда у нас не будет работы (потому что наши rowCount и columnCount будут нулевыми)
        guard size.width != 0, size.height != 0, itemCount > 0 else { return }
        //находим bestLayout
        //то есть тот, что приводит к ячейкам, соотношение сторон которых
        //имеет наименьшую вариацию из желаемого AspectRatio
        //не обязательно самый оптимальный код для этого, но легко следовать (надеюсь)
        var bestLayout: (rowCount: Int, columnCount: Int) = (1, itemCount)
        var smallestVariance: Double?
        let sizeAspectRatio = abs(Double(size.width/size.height))

        for rows in 1...itemCount {
            let columns = (itemCount / rows) + (itemCount % rows > 0 ? 1 : 0)
            if (rows - 1) * columns < itemCount {
                let itemAspectRatio = sizeAspectRatio * (Double(rows)/Double(columns))
                let variance = abs(itemAspectRatio - desiredAspectRatio)
                if smallestVariance == nil || variance < smallestVariance! {
                    smallestVariance = variance
                    bestLayout = (rowCount: rows, columnCount: columns)
                }
            }
        }
        rowCount = bestLayout.rowCount
        columnCount = bestLayout.columnCount
    }

    //MARK: Public Methods

    //где размещается каждый отдельный item, эта функция возвращает точку CGPoint центра каждого item.
    func location(ofItemAt index: Int) -> CGPoint {
        if rowCount == 0 || columnCount == 0 {
            return CGPoint.zero
        } else {
            return CGPoint(x: (CGFloat(index % columnCount) + 0.5) * itemSize.width, y: (CGFloat(index / columnCount) + 0.5) * itemSize.height)
        }
    }
}
