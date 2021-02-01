//
//  HeroDetailVewController.swift
//  TiketComtest
//
//  Created by reza pahlevi on 29/01/21.
//

import UIKit
import SDWebImage

class HeroDetailVewController: UIViewController {
    
    var vm = HeroDetailViewModel()
    
    lazy var heroImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    lazy var typeImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "melees")
        return img
    }()
    
    var titleLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    var titleRoleLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.text = "Role:"
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    var listRoleLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var attackImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "attack")
        return img
    }()
    
    var attackLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    lazy var armorImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "armor")
        return img
    }()
    
    var armorLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    lazy var speedImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "speed")
        return img
    }()
    
    var speedLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    lazy var healthImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "health")
        return img
    }()
    
    var healthLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    lazy var manaImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "mana")
        return img
    }()
    
    var manaLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    lazy var attributeImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "attribute")
        return img
    }()
    
    var attributeLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    var similarTitleLbl: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.text = "Similar Heroes"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        mappingData()
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(heroImg)
        view.addSubview(titleLbl)
        view.addSubview(typeImg)
        view.addSubview(titleRoleLbl)
        view.addSubview(listRoleLbl)
        view.addSubview(attackImg)
        view.addSubview(attackLbl)
        view.addSubview(armorImg)
        view.addSubview(armorLbl)
        view.addSubview(speedImg)
        view.addSubview(speedLbl)
        view.addSubview(healthImg)
        view.addSubview(healthLbl)
        view.addSubview(manaImg)
        view.addSubview(manaLbl)
        view.addSubview(attributeImg)
        view.addSubview(attributeLbl)
        view.addSubview(similarTitleLbl)
        
        let imgWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.3
        heroImg.snp.makeConstraints { make in
            make.top.left.equalTo(view.safeAreaLayoutGuide)
            make.size.lessThanOrEqualTo(imgWidthHeightConstant)
        }
        
        typeImg.snp.makeConstraints { make in
            make.top.equalTo(heroImg.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(50)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.centerY.equalTo(typeImg)
            make.left.equalTo(typeImg.snp.right)
            make.right.equalTo(heroImg.snp.right)
        }
        
        titleRoleLbl.snp.makeConstraints { make in
            make.top.equalTo(typeImg.snp.bottom)
            make.centerX.equalTo(heroImg)
            make.width.equalTo(heroImg)
        }
        
        listRoleLbl.snp.makeConstraints { make in
            make.top.equalTo(titleRoleLbl.snp.bottom)
            make.centerX.equalTo(heroImg)
            make.width.equalTo(heroImg)
        }
        
        similarTitleLbl.snp.makeConstraints { make in
            make.top.equalTo(listRoleLbl.snp.bottom).offset(32)
            make.centerX.equalTo(heroImg)
            make.width.equalTo(heroImg)
        }
        
        attackImg.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.left.equalTo(heroImg.snp.right).offset(16)
            make.size.equalTo(50)
        }
        
        attackLbl.snp.makeConstraints { make in
            make.centerY.equalTo(attackImg)
            make.left.equalTo(attackImg.snp.right).offset(32)
        }
        
        armorImg.snp.makeConstraints { make in
            make.top.equalTo(attackImg.snp.bottom).offset(16)
            make.left.equalTo(heroImg.snp.right).offset(16)
            make.size.equalTo(50)
        }
        
        armorLbl.snp.makeConstraints { make in
            make.centerY.equalTo(armorImg)
            make.centerX.equalTo(attackLbl)
        }
        
        speedImg.snp.makeConstraints { make in
            make.top.equalTo(armorImg.snp.bottom).offset(16)
            make.left.equalTo(heroImg.snp.right).offset(16)
            make.size.equalTo(50)
        }
        
        speedLbl.snp.makeConstraints { make in
            make.centerY.equalTo(speedImg)
            make.centerX.equalTo(attackLbl)
        }
        
        healthImg.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.left.equalTo(attackLbl.snp.right).offset(64)
            make.size.equalTo(50)
        }
        
        healthLbl.snp.makeConstraints { make in
            make.centerY.equalTo(healthImg)
            make.left.equalTo(healthImg.snp.right).offset(32)
        }
        
        manaImg.snp.makeConstraints { make in
            make.top.equalTo(healthImg.snp.bottom).offset(16)
            make.left.equalTo(healthImg.snp.left)
            make.size.equalTo(50)
        }
        
        manaLbl.snp.makeConstraints { make in
            make.centerY.equalTo(manaImg)
            make.centerX.equalTo(healthLbl)
        }
        
        attributeImg.snp.makeConstraints { make in
            make.top.equalTo(manaImg.snp.bottom).offset(16)
            make.left.equalTo(healthImg.snp.left)
            make.size.equalTo(50)
        }
        
        attributeLbl.snp.makeConstraints { make in
            make.centerY.equalTo(attributeImg)
            make.centerX.equalTo(healthLbl)
        }
        
        if let similarHeros = vm.similarHeros {
            
            let imgSizeConstant: CGFloat = UIScreen.main.bounds.width * 0.1
            var leftConstant: CGFloat = 16
            for (index, item) in similarHeros.enumerated()  {
                if index == 3 {
                    return
                }
                
                let heroImg: UIImageView = {
                    let img = UIImageView()
                    img.contentMode = .scaleAspectFit
                    img.clipsToBounds = true
                    return img
                }()
                
                view.addSubview(heroImg)
                
                heroImg.snp.makeConstraints { make in
                    make.centerY.equalTo(similarTitleLbl)
                    make.left.equalTo(similarTitleLbl.snp.right).offset(leftConstant)
                    make.size.equalTo(imgSizeConstant)
                }
                
                leftConstant += (imgSizeConstant + 16)
                let linkImage = Constants.BASE_URL + item.img
                let imageUrl = URL(string: linkImage)
                heroImg.sd_setImage(with: imageUrl, placeholderImage: UIImage(), options: .highPriority, completed: nil)
            }
        }
        
        
    }
    private func mappingData() {
        heroImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let linkImage = Constants.BASE_URL + vm.hero.img
        let imageUrl = URL(string: linkImage)
        heroImg.sd_setImage(with: imageUrl, placeholderImage: UIImage(), options: .highPriority, completed: nil)
        
        typeImg.image = UIImage(named: "\(vm.hero.attackType.lowercased())")
        
        titleLbl.text = vm.hero.localizedName
        
        listRoleLbl.text = vm.hero.roles.joined(separator: " ")
        
        attackLbl.text = "\(vm.hero.baseAttackMin.clean) - \(vm.hero.baseAttackMax.clean)"
        
        armorLbl.text = "\(vm.hero.baseArmor)"
        
        speedLbl.text = "\(vm.hero.moveSpeed.clean)"
        
        healthLbl.text = "\(vm.hero.baseHealth.clean)"
        
        manaLbl.text = "\(vm.hero.baseMana.clean)"
        
        attributeLbl.text = vm.hero.primaryAttr
    }
    
}
