//
//  SidebarView.swift
//  gemini-vault
//
//  Created by Daniel Enriquez Baena on 30/7/25.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var noteList: [Note]
    @Binding var selectedNote: Note


    var selectedNoteID: Binding<UUID> {
        Binding<UUID>(
            get: { selectedNote.id },
            set: { newID in
                if let foundNote = noteList.first(where: { $0.id == newID }) {
                    selectedNote = foundNote
                }
            }
        )
    }
    
    var body: some View {
        List(noteList, selection: selectedNoteID) {
            note in Text(note.title)
        }
    }
}

