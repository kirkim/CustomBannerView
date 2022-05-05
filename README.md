# My Custom BannerView like 배민라이더스

## Last updated on 2022.05.05

<img src="https://kirkim.github.io/assets/storage/beminBanner/result.gif" width="30%" style="max-width:200px" alt="early version">

---

## List of packages used

- <a href="https://github.com/ReactiveX/RxSwift" target="blank">RxSwift, RxCocoa</a>
- <a href="https://github.com/SnapKit/SnapKit" target="blank">Snapkit</a>

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
                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "1.png"), totalViewCellImage: BeminCellImage.sotoredImage(name: "1.png"), presentVC: Test1()),
                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "2.png"), totalViewCellImage: BeminCellImage.sotoredImage(name: "2.png"), presentVC: Test1()),
                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "3.png"), totalViewCellImage: BeminCellImage.sotoredImage(name: "3.png"), presentVC: Test1()),
                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "4.png"), totalViewCellImage: BeminCellImage.sotoredImage(name: "4.png"), presentVC: Test1()),
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
                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "1.png"), presentVC: Test1()),
                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "2.png"), presentVC: Test2()),
                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "3.png"), presentVC: Test3()),
                BannerSource(bannerImage: BeminCellImage.sotoredImage(name: "4.png"), presentVC: Test4())
            ]
        )
    )
```

If you want to present SubViewController by click Event. you have to call `.addTouchEvent(targetViewController: UIViewController)` function.

```swift
self.banner.addTouchEvent(targetViewController: self)
```

You can also change frame of BannerButton using `.setButton(frame:CGRect)`

```swift
// example
var buttonWidth = 70
banner.setButtonFrame(frame: CGRect(x: windowWidth-buttonWidth-20 , y: windowWidth*(8/13)-120, width: buttonWidth, height: buttonheight))
```

---

## Struct Type

```swift
enum BeminCellImage {
    case urlImage(url: String)
    case storedImage(name: String)
}

struct BannerSource {
    let bannerImage: BeminCellImage
    var totalViewCellImage: BeminCellImage?
    let presentVC: UIViewController
}

struct BannerSources {
    let bannerType: BannerButtonType
    var title: String = ""
    var subTitle: String = ""
    var totalViewCellRatio: CGFloat = 0
    let sources: [BannerSource]
}

struct TotalBannerListData {
    let cellImage: BeminCellImage
    let presentVC: UIViewController
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

---

### BeminCellImage

You can also use Image by URL address.

#### .urlImage(url:)

```swift
// example
BeminCellImage.urlImage(url: "https://example/exmple_image")
```

#### .storedImage(name:)

```swift
// example
BeminCellImage.storedImage(name: "example.png")
```
