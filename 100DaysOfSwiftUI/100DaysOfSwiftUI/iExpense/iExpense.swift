//
//  iExpense.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 11/15/20.
//

import SwiftUI
import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            // .self -> type of self not object
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

struct iExpense: View {
    @ObservedObject private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }

                            Spacer()
                            Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing: 
                                    Button(action: {
                                        showingAddExpense = true
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
            .sheet(isPresented: $showingAddExpense) {
                iExpenseAddView(expenses: self.expenses)
            }
        }
    }
}

extension iExpense {
    private func removeItem(atOffset offset: IndexSet) {
        self.expenses.items.remove(atOffsets: offset)
    }
}

struct iExpense_Previews: PreviewProvider {
    static var previews: some View {
        iExpense()
    }
}
