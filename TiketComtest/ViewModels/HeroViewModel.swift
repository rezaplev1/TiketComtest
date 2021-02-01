//
//  HeroViewModel.swift
//  TiketComtest
//
//  Created by reza pahlevi on 29/01/21.
//

import Foundation

protocol HeroViewModelDelegate: class {
    func success()
    func failedReq(message: String)
    
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
            result.append(Constants.AllRole)
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
                let response = try JSONDecoder().decode(HerosModel.self, from: data)
                print(response)
                RealmManager.shared.deleteAllDataForObject(HeroModel.self)
                RealmManager.shared.add(response)
                delegate?.success()
            default:
                break
            }
        }  catch _ {
            delegate?.failedReq(message: "Error mapping data")
        }
    }
    
    override func failed(interFace: CoreApi, result: AnyObject) {
        if let response = result as? String {
            delegate?.failedReq(message: response)
        }else{
            delegate?.failedReq(message: "something went wrong")
        }
    }
}




