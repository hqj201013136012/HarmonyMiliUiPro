/**
 * Icon+Text自定义弹窗
 */
@CustomDialog
export struct CommonIconAlertDialog {
  @Prop icon:ResourceStr
  @Prop textStr:string
  controller?: CustomDialogController

  build() {
    Column() {
      Image(this.icon)
        .width(176)
        .height(176)

      Text(this.textStr)
        .fontColor('#ffffff')
        .fontSize(30)
        .margin({top:15})

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#1A1A1A')
    .borderRadius(20)
  }
}