//
//  HeroCell.swift
//  TiketComtest
//
//  Created by reza pahlevi on 30/01/21.
//

import UIKit
import SDWebImage

class HeroCell: UICollectionViewCell {
    lazy var menuImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(menuImg)
        contentView.addSubview(titleLbl)
        
        menuImg.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(menuImg.snp.bottom)
            make.bottom.left.right.equalTo(self)
        }
    }
    
    func mappingData(_ hero: HeroModel){
        titleLbl.text = hero.localizedName
        
        menuImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let linkImage = Constants.BASE_URL + hero.img
        let imageUrl = URL(string: linkImage)
        menuImg.sd_setImage(with: imageUrl, placeholderImage: UIImage(), options: .highPriority, completed: nil)
    }
}
