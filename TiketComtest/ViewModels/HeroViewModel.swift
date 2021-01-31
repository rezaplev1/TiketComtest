//
//  HeroViewModel.swift
//  TiketComtest
//
//  Created by reza pahlevi on 29/01/21.
//

import Foundation

protocol HeroViewModelDelegate: class {
    func success()
    func failedReq()
    
}

class HeroViewModel: BaseViewModel {
    
    weak var delegate: HeroViewModelDelegate?
    
    var herosByRole: HerosModel? {
        if let heros = RealmManager.shared.heroModel {
            if TemporaryStatic.selectedRole == Constants.AllRole {
                return Array(heros)
            }
            let filteredHeros = heros.filter{$0.roles.contains(TemporaryStatic.selectedRole)}
            return Array(filteredHeros)
        }
        return nil
    }
    
    var rolesHero: [String]? {
        if let heros = herosByRole {
            let roles : [String] = heros.flatMap{Array($0.roles)}
            var result = Array(Set(roles)).sorted()
            result.append("All")
            return result
        }
        return nil
    }
    
    func getHeroStats(){
        api.getRequest(ServiceConfig.getHeroStats)
    }
    
    override init() {
        super.init()
    }
    
    override func finish(interFace: CoreApi, responseHeaders: HTTPURLResponse, data: Data) {
        do {
            switch interFace.serviceConfig {
            case .getHeroStats:
                let response = try JSONDecoder().decode([HeroModel].self, from: data)
                print(response)
                RealmManager.shared.deleteAllDataForObject(HeroModel.self)
                RealmManager.shared.add(response)
                delegate?.success()
            default:
                break
            }
        }  catch _ {
            
        }
    }
    
    override func failed(interFace: CoreApi, result: AnyObject) {
        
        //        do {
        //            let response = try JSONDecoder().decode(DefaultError.self, from: result as? Data ?? Data())
        //            delegate?.failedReq(message: response.message ?? "Terjadi kesalahan")
        
        //        }  catch _ {
        //            delegate?.failedReq(message: "Terjadi kesalahan")
        //        }
    }
}




