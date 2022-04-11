//
//  MyBannerByPlistUsingRxSWiftViewModel.swift
//  kirkim_App
//
//  Created by 김기림 on 2022/03/21.
//

import UIKit
import RxCocoa
import RxSwift

class BeminBannerViewModel {
    private let disposeBag = DisposeBag()
    let bannerListViewModel: BeminBannerListViewModel
    let buttonViewModel: BeminBannerButtonViewModel
    let totalBannerListViewModel: TotalBannerListViewModel
    
    // View -> ViewModel
    let buttonTapped = PublishRelay<Void>()
    
    init(parentViewController: UIViewController, data: BannerSources) {
        let bannerImageNames = data.sources.map { $0.bannerCellImageName }
        let totalPageCount = data.sources.count
        let totalBannerListData = data.sources.map { TotalBannerListData(cellImage: $0.totalViewCellImageName, presentVC: $0.presentVC)}
        self.bannerListViewModel = BeminBannerListViewModel(bannerImageNames: bannerImageNames)
        self.buttonViewModel = BeminBannerButtonViewModel(type: data.bannerType,nowPage: bannerListViewModel.nowPage, totalPageCount: totalPageCount)
        self.totalBannerListViewModel = TotalBannerListViewModel(data: totalBannerListData)
        
        buttonViewModel.tapped.emit { (nowPage, bannerType) in
            switch bannerType {
            case .basic:
                let vc = data.sources[nowPage].presentVC
                parentViewController.navigationController?.pushViewController(vc, animated: true)
            case .event:
                let listView = TotalBannerListView(title: data.title, subTitle: data.subTitle, cellRatio: data.totalViewCellRatio)
                listView.bind(self.totalBannerListViewModel)
                parentViewController.navigationController?.pushViewController(listView, animated: true)
            }
        }
        .disposed(by: disposeBag)
        
        bannerListViewModel.presentVC
            .emit { indexPath in
                let vc = data.sources[indexPath.row].presentVC
                parentViewController.present(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
