//
//  Util.swift
//  AOC_score
//
//  Created by Mina Sameh on 8/1/25.
//

import Foundation

func parseJSONFile(filePath: String) -> AocDTO? {
    let fileURL = URL(fileURLWithPath: filePath)
    
    do {
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let aocData = try decoder.decode(AocDTO.self, from: data)
        
        return aocData
    } catch {
        print("Failed to decode JSON: \(error)")
    }
    
    return nil
}
