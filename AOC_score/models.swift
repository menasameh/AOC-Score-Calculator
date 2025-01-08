//
//  models.swift
//  AOC_score
//
//  Created by Mina Sameh on 8/1/25.
//

struct Member {
    let name: String
    let stars, lastStarTs: Int
    
    var description: String {
        "Name: \(name) - Stars:\(stars) - lastStar: \(lastStarTs)"
    }
}
