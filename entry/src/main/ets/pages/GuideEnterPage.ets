import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct GuideEnterPage {
  @Local message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text('跳过')
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

      Column() {
        Text('是否开始室内机的操作引导?')
          .fontSize(40)
          .fontColor('#ffffff')

        Button('开始')
          .width(230)
          .height(75)
          .fontSize(28)
          .fontColor('#ffffff')
          .backgroundColor('#2495ff')
          .align(Alignment.Center)
          .borderRadius(12.5)
          .margin({ top: 98 })
          .onClick(() => {
            router.pushUrl({
              url: 'pages/GuideViewPage'
            })
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
      })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon_guide_page_0'))
    .backgroundImageSize(ImageSize.FILL)
  }
}