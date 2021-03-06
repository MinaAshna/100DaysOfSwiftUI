//
//  ContentView.swift
//  Bookworm
//
//  Created by Mina Ashna on 03/12/2020.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc

    @FetchRequest(
        sortDescriptors: [
            // Having more than 2 sortDescriptor has performance impact
            NSSortDescriptor(keyPath: \Book.title, ascending: true),
            NSSortDescriptor(keyPath: \Book.author, ascending: true)
        ], animation: .default) private var books: FetchedResults<Book>
    
    @State private var showingAddBookScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown title")
                                .font(.headline)
                            Text(book.author ?? "Unknown author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
                .navigationBarTitle("Bookworm")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                        Button(action: {
                                            self.showingAddBookScreen.toggle()
                                        }) {
                                            Image(systemName: "plus")
                                        }
                ).sheet(isPresented: $showingAddBookScreen) {
                    AddBookView().environment(\.managedObjectContext, self.moc)
                }
        }
    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

extension ContentView {
    private func deleteBooks(atOffset offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
