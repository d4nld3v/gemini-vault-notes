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
        TextEditor(text: $note.text)
            .font(.system(size: 18))
            .navigationTitle(note.title)
            .padding(12)
    }
}
