import { router } from '@kit.ArkUI'

@Entry
@ComponentV2
struct GuideViewPage {
  private swiperController: SwiperController = new SwiperController()
  @Local currentIndex: number = 0
  // @Local pagePics: Array<number> = []
  @Local picList: Array<ResourceStr> = [
    $r('app.media.icon_guide_page_1'),
    $r('app.media.icon_guide_page_2'),
    $r('app.media.icon_guide_page_3'),
    $r('app.media.icon_guide_page_4'),
    $r('app.media.icon_guide_page_5'),
    $r('app.media.icon_guide_page_6'),
    $r('app.media.icon_guide_page_7'),
    $r('app.media.icon_guide_page_8'),
  ]

  build() {
    RelativeContainer() {
      Swiper(this.swiperController) {
        ForEach(this.picList, (item: ResourceStr, index: number) => {
          Image(item)
            .width('100%')
            .height('100%')
        }, (item: ResourceStr) => item + new Date().getTime().toString())
      }
      .width('100%')
      .height('100%')
      .autoPlay(false)
      .loop(false)
      .onChange(e => {
        this.currentIndex = e
      })

      Text(this.currentIndex == this.picList.length - 1 ? '完成8/8' : '跳过')
        .id('pass_tv')
        .fontSize(28)
        .fontColor('#ffffff')
        .width(175)
        .height(70)
        .backgroundColor('#262626')
        .textAlign(TextAlign.Center)
        .borderRadius(12)
        .margin({ top: 35, right: 70 })
        .alignRules({
          right: { anchor: '__container__', align: HorizontalAlign.End },
          top: { anchor: '__container__', align: VerticalAlign.Top }
        })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Index'
          })
        })


      if (this.currentIndex < this.picList.length - 1) {
        Text('下一步' + (this.currentIndex + 1) + '/8')
          .fontSize(28)
          .fontColor('#ffffff')
          .width(175)
          .height(70)
          .backgroundColor('#262626')
          .textAlign(TextAlign.Center)
          .borderRadius(12)
          .margin({ top: 35, right: 30 })
          .alignRules({
            right: { anchor: 'pass_tv', align: HorizontalAlign.Start },
            top: { anchor: '__container__', align: VerticalAlign.Top }
          })
          .onClick(() => {
            this.swiperController.showNext()
          })
      }

      if (this.currentIndex > 0) {
        Text('上一步')
          .fontSize(28)
          .fontColor('#ffffff')
          .width(175)
          .height(70)
          .backgroundColor('#262626')
          .textAlign(TextAlign.Center)
          .borderRadius(12)
          .margin({ top: 35, left: 70 })
          .alignRules({
            left: { anchor: '__container__', align: HorizontalAlign.Start },
            top: { anchor: '__container__', align: VerticalAlign.Top }
          })
          .onClick(() => {
            this.swiperController.showPrevious()
          })
      }

    }
  }
}