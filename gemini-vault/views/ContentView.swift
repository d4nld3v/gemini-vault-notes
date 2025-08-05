
import SwiftUI

struct ContentView: View {

    @State public var noteList : [Note] = []
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

        let newNote = Note(text: "", title: "New Note")

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
                Text("Select a note to edit")
                    .foregroundColor(.secondary)
            }
        }
           .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: createNewNote) {
                    Label("New Note", systemImage: "plus")
                }
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button("Save") {
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
