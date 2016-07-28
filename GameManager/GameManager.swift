//
//  GameManager.swift
//  GameManager
//
//  Created by Martin Walsh on 26/07/2016.
//
//  Make sure to look in AppDelegate.swift

import Foundation

/* Define properties to be stored in NSUserDefaults */
extension DefaultsKeys {
    static let highScore = DefaultsKey<Int>("highScore")
    static let characters = DefaultsKey<NSData>("characters")
}

class GameManager : CustomStringConvertible {
    
    /* Swift Singleton */
    static let sharedInstance = GameManager()
    
    /* Properties */
    var highScore = 0
    var characters:[Character] = []
    
    /* Debug description */
    var description:String {
        return "High Score: \(highScore), Total characters: \(characters.count)"
    }
    
    private init() {
        /* Load stored data by default */
        print("GameManager: Initialised")
        loadData()
        
        /* Add new character */
        let newCharacter = Character(health: 10, special: true, type: .Fire)
        characters.append(newCharacter)
    }
    
    func saveData() {
        /* Store specified property data */
        print("GameManager: saveData")
        
        Defaults[.highScore] = highScore
        
        /* Convert array of characters to NSData */
        Defaults[.characters] = NSKeyedArchiver.archivedDataWithRootObject(characters)
        
        /* Debug */
        print(self)
    }
    
    func loadData() {
        /* Populate specified properties with stored data */
        print("GameManager: loadData")
        
        highScore = Defaults[.highScore]
        
        /* Restore array of characters from NSData */
        if let characterData = Defaults["characters"].data {
            characters = NSKeyedUnarchiver.unarchiveObjectWithData(characterData) as! [Character]
        }
        
        /* Debug */
        print(self)
    }
}