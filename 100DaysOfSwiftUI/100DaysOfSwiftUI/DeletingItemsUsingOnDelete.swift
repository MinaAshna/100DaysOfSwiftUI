//
//  DeletingItemsUsingOnDelete.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 11/15/20.
//

import SwiftUI

struct DeletingItemsUsingOnDelete: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
}

extension DeletingItemsUsingOnDelete {
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct DeletingItemsUsingOnDelete_Previews: PreviewProvider {
    static var previews: some View {
        DeletingItemsUsingOnDelete()
    }
}
