//
//  Note.swift
//  gemini-vault
//
//  Created by Daniel Enriquez Baena on 30/7/25.
//

import Foundation

struct Note : Identifiable, Equatable, Hashable{
    var text: String
    var title: String
    var id = UUID()
}
