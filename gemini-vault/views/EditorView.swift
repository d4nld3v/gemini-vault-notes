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
           
            TextField("Title", text: $note.title)
                .font(.title2)
                .fontWeight(.bold)
            
            Divider()
                .padding(.horizontal, 12)
            
     
            TextEditor(text: $note.text)
                .font(.system(size: 18))
                
        }
    }
}
