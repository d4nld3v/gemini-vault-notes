//
//  ContentView.swift
//  gemini-vault
//
//  Created by Daniel Enriquez Baena on 30/7/25.
//

import SwiftUI

struct ContentView: View {
    
    //lista de notas
    @State public var noteList : [Note] = []
    
    //id de la nota seleccionada
    @State public var selectedNote: Note

    
    init() {
        let initialNotes: [Note] = [
            Note(text: "Hola soy el contenido de la primera nota", title: "Nota 1"),
                            
            Note(text: "Hola soy el contenido de la segunda nota", title: "Nota 2")
        ]
        
        _noteList = State(initialValue: initialNotes)
        _selectedNote = State(initialValue: initialNotes[1])

    }


    var body: some View {
        NavigationSplitView {
            SidebarView(noteList : $noteList , selectedNote: $selectedNote)
        } detail: {
            EditorView(note: $selectedNote)  
        }
    }
}

#Preview {
    ContentView()
}
