//
//  iExpenseAddView.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 11/15/20.
//

import SwiftUI

struct iExpenseAddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing:
                                    Button("Save", action: {
                                        if let actualAmoutn = Int(self.amount) {
                                            let expenseItem = ExpenseItem(name: self.name, type: self.type, amount: actualAmoutn)
                                            self.expenses.items.append(expenseItem)
                                            self.presentationMode.wrappedValue.dismiss()
                                        }
                                    })
            )
        }
    }
}

struct iExpenseAddView_Previews: PreviewProvider {
    static var previews: some View {
        iExpenseAddView(expenses: Expenses())
    }
}
