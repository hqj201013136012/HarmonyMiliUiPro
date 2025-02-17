@Component
export struct ItemSetArrowView {
  @Prop name: string
  @Prop rightText: string

  build() {
    Column() {
      RelativeContainer() {

        Text(this.name)
          .fontColor('#ffffff')
          .fontSize(28)
          .margin({left:56})
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })

        Image($r('app.media.icon_next'))
          .width(36)
          .height(36)
          .margin({right:56})
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            right: { anchor: "__container__", align: HorizontalAlign.End },
          })
          .id('right_next_img')

        Text(this.rightText)
          .fontColor('#ffffff')
          .fontSize(28)
          .margin({right:8})
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            right: { anchor: "right_next_img", align: HorizontalAlign.Start },
          })
      }
      .backgroundColor('#1A1A1A')
      .borderRadius(12)
      .height(100)

    }

  }
}
