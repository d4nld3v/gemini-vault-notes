//
//  EditorView.swift
//  gemini-vault
//
//  Created by Daniel Enriquez Baena on 30/7/25.
//
import SwiftUI

struct EditorView : View{
    
    @Binding var note: Note
    
    var body: some View{
        VStack(alignment: .leading, spacing: 0) {
           
            TextField("Título de la nota", text: $note.title)
                .font(.title2)
                .fontWeight(.bold)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 12)
                .padding(.top, 12)
                .padding(.bottom, 8)
            
            Divider()
                .padding(.horizontal, 12)
            
     
            TextEditor(text: $note.text)
                .font(.system(size: 18))
                .padding(12)
        }
    }
}
