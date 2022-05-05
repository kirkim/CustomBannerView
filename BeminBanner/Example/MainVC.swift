//
//  MainVC.swift
//  BeminBanner
//
//  Created by 김기림 on 2022/04/11.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
//    private let banner = BeminBannerView(
//        data: BannerSources(
//            bannerType: .basic,
//            sources: [
//                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "1.png"), presentVC: Test1()),
//                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "2.png"), presentVC: Test2()),
//                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "3.png"), presentVC: Test3()),
//                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "4.png"), presentVC: Test4())
//            ]
//        )
//    )
    private let banner = BeminBannerView(
        data: BannerSources(
            bannerType: .event,
            title: "이벤트",
            subTitle: "지금 진행 중!",
            totalViewCellRatio: 0.5,
            sources: [
                BannerSource(bannerImage: BeminCellImage.storedImage(name: "1.png"), totalViewCellImage: BeminCellImage.storedImage(name: "1.png"), presentVC: Test1()),
                BannerSource(bannerImage: BeminCellImage.storedImage(name: "2.png"), totalViewCellImage: BeminCellImage.storedImage(name: "2.png"), presentVC: Test1()),
                BannerSource(bannerImage: BeminCellImage.storedImage(name: "3.png"), totalViewCellImage: BeminCellImage.storedImage(name: "3.png"), presentVC: Test1()),
                BannerSource(bannerImage: BeminCellImage.storedImage(name: "4.png"), totalViewCellImage: BeminCellImage.storedImage(name: "4.png"), presentVC: Test1()),
            ]
        )
    )
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        attribute()
        layout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        self.banner.addTouchEvent(targetViewController: self)
    }
    
    private func attribute() {
        self.view.backgroundColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func layout() {
        self.view.addSubview(banner)
        
        banner.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(70)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
}
