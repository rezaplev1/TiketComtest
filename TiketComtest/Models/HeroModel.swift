//
//  HeroModel.swift
//  TiketComtest
//
//  Created by reza pahlevi on 29/01/21.
//

import Foundation
import RealmSwift


typealias HerosModel = [HeroModel]

// MARK: - HerosModel
@objcMembers class HeroModel: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var localizedName: String = ""
    @objc dynamic var primaryAttr: String = ""
    @objc dynamic var attackType: String = ""
    var roles = List<String>()
    @objc dynamic var img: String = ""
    @objc dynamic var icon: String = ""
    @objc dynamic var baseHealth: Int = 0
    @objc dynamic var baseMana: Int = 0
    @objc dynamic var baseAttackMax: Int = 0
    @objc dynamic var moveSpeed: Int = 0

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
        case baseHealth = "base_health"
        case baseMana = "base_mana"
        case baseAttackMax = "base_attack_max"
        case moveSpeed = "move_speed"
   
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        localizedName = try container.decode(String.self, forKey: .localizedName)
        primaryAttr = try container.decode(String.self, forKey: .primaryAttr)
        attackType = try container.decode(String.self, forKey: .attackType)
        let listRoles = try container.decode([String].self, forKey: .roles)
        roles.append(objectsIn: listRoles)
        img = try container.decode(String.self, forKey: .img)
        icon = try container.decode(String.self, forKey: .icon)
        baseHealth = try container.decode(Int.self, forKey: .baseHealth)
        baseMana = try container.decode(Int.self, forKey: .baseMana)
        baseAttackMax = try container.decode(Int.self, forKey: .baseAttackMax)
        moveSpeed = try container.decode(Int.self, forKey: .moveSpeed)
        super.init()
    }
    
    required init()
    {
        super.init()
    }
}


