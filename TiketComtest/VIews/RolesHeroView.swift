//
//  RolesHeroView.swift
//  TiketComtest
//
//  Created by reza pahlevi on 31/01/21.
//

import UIKit

protocol RolesHeroViewDelegate : class {
    func didSelectedBtn(_ selectedRole: String)
}

class RolesHeroView: UIView {
    weak var delegate: RolesHeroViewDelegate?
    
    var scrollX = [CGFloat]()
    var categoryButtonHeight = 0
    
    private lazy var scrollView: UIScrollView = { [unowned self] in
        let sc = UIScrollView()
        sc.showsHorizontalScrollIndicator = false
        sc.delegate = self
        return sc
    }()
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(self)
        }
    }
    
    func createListCategory(roles: [String]) {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        scrollX.removeAll()
        if !roles.isEmpty {
            var count = 0
            categoryButtonHeight = 0
            var py = 0
            for data in roles {
                let btn = UIButton()
                btn.tag = count
                scrollView.addSubview(btn)
                btn.frame = CGRect(x: py, y: categoryButtonHeight + 16, width: 130, height: 30)
                btn.backgroundColor = .black
                btn.layer.cornerRadius = 10
                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor.black.cgColor
                btn.setTitleColor(.white, for: .normal)
                btn.setTitle(data, for: .normal)
                btn.contentEdgeInsets = UIEdgeInsets(top: 10,left: 0,bottom: 10,right: 0)
                btn.clipsToBounds = true
                btn.addTarget(self, action: #selector(scrollButtonAction), for: .touchUpInside)
                
                categoryButtonHeight = categoryButtonHeight + Int(btn.frame.size.height) + 8
                count += 1
                scrollX.append(CGFloat(categoryButtonHeight))
            }
            py =  Int(scrollView.frame.width)
            scrollView.contentSize = CGSize(width: py, height: categoryButtonHeight + 30)
        }
    }
    
    @objc func scrollButtonAction(sender: UIButton) {
        if let nameButton = sender.titleLabel?.text {
            delegate?.didSelectedBtn(nameButton)
        }
    }
}

extension RolesHeroView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}
