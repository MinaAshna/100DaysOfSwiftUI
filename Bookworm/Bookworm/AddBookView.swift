//
//  AddBookView.swift
//  Bookworm
//
//  Created by Mina Ashna on 03/12/2020.
//

import SwiftUI
import CoreData

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) private var presentationMode

    @State private var title = ""
    @State private var review = ""
    @State private var genre = ""
    @State private var author = ""
    @State private var rating = 3
    
    private let genres = ["Fantasy", "Romance", "Thriller", "Horror", "Kid", "Poetry"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save") {
                        saveBookToCoreData()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Add book")
        }
    }
}

extension AddBookView {
    private func saveBookToCoreData() {
        let newBook = Book(context: self.moc)
        newBook.title = title
        newBook.author = author
        newBook.review = review
        newBook.genre = genre
        newBook.rating = Int16(rating)
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
