//
//  Models.swift
//  AOC_score
//
//  Created by Mina Sameh on 8/1/25.
//

// MARK: - Aoc
struct AocDTO: Codable {
    let members: [String: MemberDTO]
}

// MARK: - Member
struct MemberDTO: Codable {
    let id: Int
    let name: String?
    let stars, lastStarTs: Int

    enum CodingKeys: String, CodingKey {
        case name, id
        case stars
        case lastStarTs = "last_star_ts"
    }
}
