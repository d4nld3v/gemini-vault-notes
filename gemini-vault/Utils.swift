//
//  Utils.swift
//  gemini-vault
//
//  Created by Daniel Enriquez Baena on 5/8/25.
//

import Foundation

func getDocumentsDirectory() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
}

