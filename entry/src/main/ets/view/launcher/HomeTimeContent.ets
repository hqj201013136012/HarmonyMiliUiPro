@Preview
@ComponentV2
export struct HomeTimeContent {
  // @Prop timeStr: string = ''
  // @Prop dateStr: string = ''
  // @Prop timeStage: string = ''

  build() {
    // 中间时间区域
    RelativeContainer() {
      Text('欢迎回家！')
        .fontSize(30)
        .margin({ left: 30, top: 30 })
        .fontColor('#ffffff')

      // Text(this.timeStage)
      //   .width(80)
      //   .height(45)
      //   .fontSize(25)
      //   .margin({ right: 30, top: 30 })
      //   .textAlign(TextAlign.Center)
      //   .fontColor('#ffffff')
      //   .backgroundColor(0x313131)
      //   .borderRadius(5)
      //   .alignRules({
      //     top: { anchor: "__container__", align: VerticalAlign.Top },
      //     right: { anchor: "__container__", align: HorizontalAlign.End }
      //   })

      TextClock()
        .format("aa")
        .width(80)
        .height(45)
        .fontSize(25)
        .margin({ right: 30, top: 30 })
        .fontColor('#ffffff')
        .backgroundColor(0x313131)
        .borderRadius(5)
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          right: { anchor: "__container__", align: HorizontalAlign.End }
        })

      TextClock()
        .fontSize(112)
        .fontColor('#ffffff')
        .format("HH:mm")
        .dateTimeOptions({ hour: "2-digit" })
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center },
          middle: { anchor: "__container__", align: HorizontalAlign.Center },
        })
        .id("time_tv")

      // Text(this.timeStr)
      //   .fontSize(112)
      //   .fontColor('#ffffff')
      //   .alignRules({
      //     center: { anchor: "__container__", align: VerticalAlign.Center },
      //     middle: { anchor: "__container__", align: HorizontalAlign.Center },
      //   })
      //   .id("time_tv")

      // Text(this.dateStr)
      //   .fontSize(27)
      //   .fontColor('#ffffff')
      //   .alignRules({
      //     top: { anchor: "time_tv", align: VerticalAlign.Bottom },
      //     middle: { anchor: "__container__", align: HorizontalAlign.Center },
      //   })

      TextClock()
        .format("M月d日 EEEE")
        .fontSize(27)
        .fontColor('#ffffff')
        .alignRules({
          top: { anchor: "time_tv", align: VerticalAlign.Bottom },
          middle: { anchor: "__container__", align: HorizontalAlign.Center },
        })

    }
    .height('54.5%')
    .width('45%')
    .backgroundColor(0x1A1A1A)
    .borderRadius(20)
    .alignRules({
      top: { anchor: "status_bar", align: VerticalAlign.Bottom },
    })
    .margin({ left: 48, top: 20 })
    .id("center_content")
  }
}