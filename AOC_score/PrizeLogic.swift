//
//  PrizeLogic.swift
//  AOC_score
//
//  Created by Mina Sameh on 8/1/25.
//

class PrizeLogic {
    private let members: [Member]
    private let winners: [Member]
    
    init(members: [Member]) {
        self.members = members
        self.winners = members
    }
    
    var modifiersList: [PrizeLogicModifier] = []
    
    func sortByScore(tieSolvingStrategy: SortByScore.TieSolvingStrategy) -> Self {
        modifiersList.append(SortByScore(tieSolvingStrategy: tieSolvingStrategy))
        return self
    }
    
    func takeFirst(_ length: Int) -> Self {
        modifiersList.append(TakeFirst(length: length))
        return self
    }
    
    func getWinners() -> [Member] {
        modifiersList.reduce(members) { members, modifier in modifier.modify(members: members) }
    }
}

protocol PrizeLogicModifier {
    func modify(members: [Member]) -> [Member]
}

struct SortByScore: PrizeLogicModifier {
    enum TieSolvingStrategy {
        case firstToGetStar
        case name
    }
    let tieSolvingStrategy: TieSolvingStrategy
    
    func modify(members: [Member]) -> [Member] {
        members.sorted { left, right in
            if left.stars == right.stars {
                switch tieSolvingStrategy {
                case .firstToGetStar:
                    return left.lastStarTs < right.lastStarTs
                case .name:
                    return left.name < right.name
                }
            }
            
            return left.stars > right.stars
        }
    }
}

struct TakeFirst: PrizeLogicModifier {
    let length: Int
    
    func modify(members: [Member]) -> [Member] {
        Array(members.prefix(length))
    }
}
