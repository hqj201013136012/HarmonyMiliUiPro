@Component
export struct HomeMenu {
  build() {
    // 免打扰，紧急救援，呼叫中心
    RelativeContainer() {
      Row() {
        Column() {
          Image($r('app.media.icon_disturb'))
            .width(70)
            .height(70)
            .margin({ top: 10 })

          Text('免打扰')
            .fontSize(22)
            .fontColor('#ffffff')
        }
        .width('33%')
        .height('100%')

        Column() {
          Image($r('app.media.icon_sos'))
            .width(70)
            .height(70)
            .margin({ top: 10 })

          Text('紧急呼救')
            .fontSize(22)
            .fontColor('#ffffff')
        }
        .width('33%')
        .height('100%')

        Column() {
          Image($r('app.media.icon_callcenter'))
            .width(70)
            .height(70)
            .margin({ top: 10 })

          Text('呼叫中心')
            .fontSize(22)
            .fontColor('#ffffff')
        }
        .width('33%')
        .height('100%')
      }
      .width('100%')

    }
    .width('45%')
    .backgroundColor(0x1A1A1A)
    .borderRadius(20)
    .alignRules({
      top: { anchor: "center_content", align: VerticalAlign.Bottom },
      bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
    })
    .margin({ left: 48, top: 20, bottom: 48 })
    .id('bottom_menu')
  }
}