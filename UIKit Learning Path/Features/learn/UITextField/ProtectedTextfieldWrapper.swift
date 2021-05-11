//
//  ProtectedTextfieldWrapper.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 11/05/21.
//

import UIKit

protocol ProtectedTextfieldWrapper {
    var minimumUsernameLength: Int { get set }
    var minimumPasswordLength: Int { get set }
    func wrapCharacters(characters: String) -> String
}

class ProtectedTextfieldWrapperImpl: ProtectedTextfieldWrapper {
    var minimumUsernameLength: Int
    var minimumPasswordLength: Int
    
    init(
        minUsernameLength: Int = 4,
        minPasswordLength: Int = 6
    ) {
        self.minimumUsernameLength = minUsernameLength
        self.minimumPasswordLength = minPasswordLength
    }
    
    func wrapCharacters(characters: String) -> String {
        let charactersResult = loopThroughCharacters(characters)
        return String(charactersResult)
    }
    
    fileprivate func loopThroughCharacters(_ characters: String) -> [Character] {
        var displayName = [Character]()
        for (index, character) in characters.enumerated() {
            renderText(
                at: index,
                for: character,
                source: characters,
                forResult: &displayName
            )
        }
        
        return displayName
    }
    
    fileprivate func renderText(
        at index: Int,
        for character: Character,
        source: String,
        forResult displayName: inout [Character])
    {
        if index > source.count - minimumUsernameLength {
            displayName.append(character)
        } else {
            displayName.append("*")
        }
    }
}
