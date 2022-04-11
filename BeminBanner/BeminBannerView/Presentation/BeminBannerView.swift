//
//  MyBannerUsingRxSwift.swift
//  kirkim_App
//
//  Created by 김기림 on 2022/03/16.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BeminBannerView: UIView {
    let disposeBag = DisposeBag()
    private let bannerListView = BeminBannerListView()
    private let bannerButton = BeminBannerButton()

    //MARK: - MyBannerUsingRxswift init
    init() {
        super.init(frame: CGRect.zero)
        self.layout()
        self.attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - MyBannerUsingRxswift: layout, bind function
    private func layout() {
        [bannerListView, bannerButton].forEach {
            self.addSubview($0)
        }
        
        bannerListView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
        
        self.bannerButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private func attribute() {
   
    }
    
    func bind(_ viewModel: BeminBannerViewModel) {
        self.bannerListView.bind(viewModel.bannerListViewModel)
        self.bannerButton.bind(viewModel.buttonViewModel)
        
        self.bannerButton.rx.tap
            .bind(to: viewModel.buttonTapped)
            .disposed(by: disposeBag)
    }
}