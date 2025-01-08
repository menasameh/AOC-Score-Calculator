//
//  main.swift
//  AOC_score
//
//  Created by Mina Sameh on 8/1/25.
//

import Foundation

let arguments = CommandLine.arguments

guard arguments.count > 1 else {
    fatalError("Usage: \(arguments[0]) <file-path>")
}

let filePath = arguments[1]
guard let AocData = parseJSONFile(filePath: filePath) else {
    fatalError("File contents at \(filePath) could not be parsed")
}

let prizeLogic = PrizeLogic(members: AocData.members.map { Member($0.value) })

let winners = prizeLogic
    .sortByScore(tieSolvingStrategy: .firstToGetStar)
    .takeFirst(3)
    .getWinners()

print(winners.map {$0.description}.joined(separator: "\n"))

extension Member {
    init(_ member: MemberDTO) {
        name = member.name ?? ""
        stars = member.stars
        lastStarTs = member.lastStarTs
    }
}
