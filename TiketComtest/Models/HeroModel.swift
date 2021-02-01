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
    @objc dynamic var baseHealth: Double = 0
    @objc dynamic var baseMana: Double = 0
    @objc dynamic var baseAttackMax: Double = 0
    @objc dynamic var moveSpeed: Double = 0
    @objc dynamic var baseAttackMin: Double = 0
    @objc dynamic var baseArmor: Double = 0

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
        case baseAttackMin = "base_attack_min"
        case baseArmor = "base_armor"
   
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
        baseHealth = try container.decode(Double.self, forKey: .baseHealth)
        baseMana = try container.decode(Double.self, forKey: .baseMana)
        baseAttackMax = try container.decode(Double.self, forKey: .baseAttackMax)
        moveSpeed = try container.decode(Double.self, forKey: .moveSpeed)
        baseAttackMin = try container.decode(Double.self, forKey: .baseAttackMin)
        baseArmor = try container.decode(Double.self, forKey: .baseArmor)
        super.init()
    }
    
    required init()
    {
        super.init()
    }
}


