//
//  HeroDetailViewModel.swift
//  TiketComtest
//
//  Created by reza pahlevi on 31/01/21.
//

import Foundation

class HeroDetailViewModel: BaseViewModel {
    
    var hero: HeroModel!
    
    var similarHeros: HerosModel? {
        
        if let heros = RealmManager.shared.heroModel {
            let filteredAttrHeros = heros.filter{$0.primaryAttr.contains(self.hero.primaryAttr)}
            if hero.primaryAttr == "agi" {
                let filteredHeros = filteredAttrHeros.sorted {
                    $0.moveSpeed > $1.moveSpeed
                }
                return Array(filteredHeros)
            }
            
            if hero.primaryAttr == "str" {
                let filteredHeros = filteredAttrHeros.sorted {
                    $0.baseAttackMax > $1.baseAttackMax
                }
                return Array(filteredHeros)
            }
            
            if hero.primaryAttr == "int" {
                let filteredHeros = filteredAttrHeros.sorted {
                    $0.baseMana > $1.baseMana
                }
                return Array(filteredHeros)
            }
            
        }
        return nil
    }
}
