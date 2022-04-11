//
//  ParentMainVC.swift
//  BeminBanner
//
//  Created by 김기림 on 2022/04/11.
//

import UIKit
import RxCocoa
import RxSwift

class ParentMainVC: UIViewController {
    private let button = UIButton(type: .system)
    private let disposeBag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        button.setTitle("메인뷰열기", for: .normal)
        button.rx.tap
            .bind {
                let vc = MainVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        button.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(200)
            $0.centerX.equalToSuperview()
        }
    }
}
