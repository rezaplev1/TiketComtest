//
//  HeroListViewController.swift
//  TiketComtest
//
//  Created by reza pahlevi on 29/01/21.
//

import UIKit
import SnapKit

class HeroListViewController: UIViewController {
    
    lazy var rolesView: RolesHeroView = {
        let vw = RolesHeroView()
        vw.delegate = self
        vw.backgroundColor = .clear
        vw.clipsToBounds = true
        return vw
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(HeroCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var vm = HeroViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RealmManager.shared.loadRealmObject()
        setupView()
        vm.delegate = self
        vm.getHeroStats()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = TemporaryStatic.selectedRole
        view.addSubview(rolesView)
        view.addSubview(collectionView)
        
        rolesView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(150)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
            make.left.equalTo(rolesView.snp.right)
        }
        
        if let roles = vm.rolesHero {
            rolesView.createListCategory(roles: roles)
        }
        
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.2
        
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)
        
        return layout
    }
    
}

// MARK: - UICollectionViewDelegate & Data Source
extension HeroListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.herosByRole?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! HeroCell
        if let hero = vm.herosByRole?[indexPath.item] {
            cell.mappingData(hero)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let hero = vm.herosByRole?[indexPath.item] {
            let vc = HeroDetailVewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}

// MARK: - HeroViewModelDelegate
extension HeroListViewController: HeroViewModelDelegate {
    func success() {
        collectionView.reloadData()
        if let roles = vm.rolesHero {
            rolesView.createListCategory(roles: roles)
        }
    }
    
    func failedReq() {
        
    }
}

extension HeroListViewController: RolesHeroViewDelegate {
    func didSelectedBtn(_ selectedRole: String) {
        title = selectedRole
        TemporaryStatic.selectedRole = selectedRole
        collectionView.reloadData()
    }
}
