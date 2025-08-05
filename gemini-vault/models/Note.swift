//
//  Note.swift
//  gemini-vault
//
//  Created by Daniel Enriquez Baena on 30/7/25.
//

import Foundation

struct Note : Identifiable, Equatable, Hashable, Codable{
    var text: String
    var title: String
    var id = UUID()
}

func loadNotes() -> [Note] {
    let url = getDocumentsDirectory().appendingPathComponent("notes.json")
    
    print( url.path())
    
    if !FileManager.default.fileExists(atPath: url.path()){
        do {
            let emptyData = try JSONEncoder().encode([Note]())
            try emptyData.write(to: url)
            print("file created")
        }catch {
            print("file not created! \(error)")
        }
    }
    
    do {
        let data = try Data(contentsOf: url)
        let notes = try JSONDecoder().decode([Note].self, from: data)
        return notes
    }catch {
        print("No se puede cargar las notas \(error)")
        return []
    }
}


func saveNotes(_ notes: [Note]){
    let url = getDocumentsDirectory().appendingPathComponent("notes.json")
    do {
        let data = try JSONEncoder().encode(notes)
        try data.write(to: url)
        print("saved notes!")
    }
    catch {
        print("not saved! \(error)")
    }
}

