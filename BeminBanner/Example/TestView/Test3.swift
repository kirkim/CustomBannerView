//
//  Test3.swift
//  BeminBanner
//
//  Created by 김기림 on 2022/04/11.
//

import UIKit

class Test3: UIViewController {
    private let titleLabel = UILabel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.view.backgroundColor = .gray
        titleLabel.text = "세번째 뷰"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(70)
        }
    }
}
