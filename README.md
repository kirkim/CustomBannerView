# My Custom BannerView like 배민라이더스

## Last updated on 2022.04.13

<img src="https://kirkim.github.io/assets/storage/beminBanner/result.gif" width="30%" style="max-width:200px" alt="early version">

---

## How to use (Example)

you just make `BeminBannerView`. then choose either `basic` type or `event` type.

## &#91; bannerType: .event &#93;

```swift
private let banner = BeminBannerView(
    data: BannerSources(
        bannerType: .event,
        title: "이벤트",
        subTitle: "지금 진행 중!",
        totalViewCellRatio: 0.5,
        sources: [
            BannerSource(bannerCellImageName: "1.png", totalViewCellImageName: "1.png", presentVC: Test1()),
            BannerSource(bannerCellImageName: "2.png", totalViewCellImageName: "2.png", presentVC: Test2()),
            BannerSource(bannerCellImageName: "3.png", totalViewCellImageName: "3.png", presentVC: Test3()),
            BannerSource(bannerCellImageName: "4.png", totalViewCellImageName: "4.png", presentVC: Test4())
        ]
    )
)
```

## &#91; bannerType: .basic &#93;

```swift
private let banner = BeminBannerView(
        data: BannerSources(
            bannerType: .basic,
            sources: [
                BannerSource(bannerCellImageName: "1.png", presentVC: Test1()),
                BannerSource(bannerCellImageName: "2.png", presentVC: Test2()),
                BannerSource(bannerCellImageName: "3.png", presentVC: Test3()),
                BannerSource(bannerCellImageName: "4.png", presentVC: Test4())
            ]
        )
    )
```

If you want to present SubViewController by click Event. you have to call `.addTouchEvent(targetViewController: UIViewController)` function.

```swift
self.banner.addTouchEvent(targetViewController: self)
```

---

## Struct Type

```swift
struct BannerSource {
    let bannerCellImageName: String
    var totalViewCellImageName: String?
    let presentVC: UIViewController
}

struct BannerSources {
    let bannerType: BannerButtonType
    var title: String = ""
    var subTitle: String = ""
    var totalViewCellRatio: CGFloat = 0
    let sources: [BannerSource]
}
```

---

- `bannerType`: `.event`, `.basic`

#### .event

<img src="https://kirkim.github.io/assets/storage/beminBanner/eventButton.gif" width="25%" style="max-width:200px" alt="eventbutton">

#### .basic

<img src="https://kirkim.github.io/assets/storage/beminBanner/basicButton.gif" width="25%" style="max-width:200px" alt="basicbutton">

---

- `title`: banner main title
- `subTitle`: title in TotalBannerView

<img src="https://kirkim.github.io/assets/storage/beminBanner/title_subtitle.png" width="30%" style="max-width:200px" alt="title & subtitle">

---

- `totalViewCellRatio`:
  totalViewCellRatio = B / A

<img src="https://kirkim.github.io/assets/storage/beminBanner/ratio.png" width="30%" style="max-width:200px" alt="ratio">
