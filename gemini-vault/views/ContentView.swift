//
//  ContentView.swift
//  gemini-vault
//
//  Created b        }
      // Ocultar el título de navegación principal Enriquez Baena on 30/7/25.
//

import SwiftUI

struct ContentView: View {
    
    //lista de notas
    @State public var noteList : [Note] = []
    
    //id de la nota seleccionada
    @State public var selectedNoteID: UUID?
    
    
    private var selectedNoteBinding: Binding<Note>? {
        guard let selectedNoteID = selectedNoteID,
              let index = noteList.firstIndex(where: { $0.id == selectedNoteID }) else { 
            return nil 
        }
        
        return Binding<Note>(
            get: { noteList[index] },
            set: { noteList[index] = $0 }
        )
    }

    private func createNewNote() { 

        let newNote = Note(text: "", title: "Nueva Nota")

        noteList.append(newNote)
        selectedNoteID = newNote.id

        saveNotes(noteList)
    }
    
    init() {
        let initialNotes: [Note] = loadNotes()
        _noteList = State(initialValue: initialNotes)
       
        _selectedNoteID = State(initialValue: initialNotes.first?.id)
    }


    var body: some View {
        NavigationSplitView {
            SidebarView(noteList: $noteList, selectedNoteID: $selectedNoteID)
        } detail: {
            if let noteBinding = selectedNoteBinding {
                EditorView(note: noteBinding)
            } else {
                Text("Selecciona una nota")
                    .foregroundColor(.secondary)
            }
        }
           .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: createNewNote) {
                    Label("Nueva Nota", systemImage: "plus")
                }
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button("Guardar") {
                    saveNotes(noteList)
                }
            }
        }
        .navigationTitle("") 
    }
}

#Preview {
    ContentView()
}
