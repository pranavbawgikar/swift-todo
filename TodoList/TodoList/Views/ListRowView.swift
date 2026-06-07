//
//  ListRowView.swift
//  TodoList
//
//  Created by Pranav Bawgikar on 05/06/26.
//
import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted
                  ? "checkmark.circle"
                  : "circle")
            .foregroundColor(item.isCompleted ? .green : .yellow)
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Buy Milk", isCompleted: false)
    static var item2 = ItemModel(title: "Buy Eggs", isCompleted: true)
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
