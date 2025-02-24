@ComponentV2
export struct ItemSetTextView {
  @Require @Param name: string
  @Require @Param rightText: string

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

        Text(this.rightText)
          .fontColor('#ffffff')
          .fontSize(28)
          .margin({right:56})
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            right: { anchor: "__container__", align: HorizontalAlign.End },
          })
      }
      .backgroundColor('#1A1A1A')
      .borderRadius(12)
      .height(100)

    }

  }
}
