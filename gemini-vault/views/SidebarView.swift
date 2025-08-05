//
//  SidebarView.swift
//  gemini-vault
//
//  Created by Daniel Enriquez Baena on 30/7/25.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var noteList: [Note]
    @Binding var selectedNoteID: UUID?

    var body: some View {
        List(noteList, selection: $selectedNoteID) { note in
            Text(note.title)
        }
    }
}

