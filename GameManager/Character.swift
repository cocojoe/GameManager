//
//  Character.swift
//  GameManager
//
//  Created by Martin Walsh on 28/07/2016.
//
//

import SpriteKit

enum AttackType:Int {
    case None,Fire,Wind,Water
}

class Character: NSObject, NSCoding {
    
    /* Properties */
    var health = 0
    var special = false
    var type:AttackType = .None
    
    init(health: Int, special: Bool, type: AttackType) {
        self.health = health
        self.special = special
        self.type = type
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let health = aDecoder.decodeObjectForKey("health") as? Int,
            let special = aDecoder.decodeObjectForKey("special") as? Bool,
            let type = aDecoder.decodeObjectForKey("type") as? Int
            else { return nil }
        
        self.init(health: health, special: special, type: AttackType(rawValue:type)! )
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(health, forKey: "health")
        aCoder.encodeObject(special, forKey: "special")
        
        /* Enumeration needs to be stored as the raw value */
        aCoder.encodeObject(type.rawValue, forKey: "type")
    }
}