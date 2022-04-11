//
//  BannerSources.swift
//  BeminBanner
//
//  Created by 김기림 on 2022/04/11.
//

import UIKit

struct BannerSource {
    let bannerCellImageName: String
    let totalViewCellImageName: String
    let presentVC: UIViewController
}

struct BannerSources {
    let bannerType: BannerButtonType
    let title: String
    let subTitle: String
    let totalViewCellRatio: CGFloat
    let sources: [BannerSource]
}
